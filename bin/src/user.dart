import 'dart:convert';
import 'dart:io';

import '../main.dart';
import 'base.dart';

class UserCmd implements CommandInstance {
  PrintFn? print;
  @override
  ArgParser command(ArgParser parser) {
    return parser
      ..addOption('username', abbr: 'u', help: '用户名')
      ..addOption('passwd', abbr: 'p', help: '密码')
      ..addOption('token', abbr: 't', help: 'API Key')
      ..addFlag('code', negatable: false, help: '需要二次验证码');
  }

  @override
  Future<void> exec(ArgResults args, PrintFn print) async {
    var username = args['username'] ?? Instance.cfg.config['auth']?['username'];
    String? token = args['token'];
    var code = args['code'];
    var passwd = args['passwd'];

    this.print = print;
    if (username == Instance.cfg.config['auth']?['username'] &&
        token == null &&
        Instance.cfg.config['auth']?['token'] != null) {
      token = (Instance.cfg.config['auth']?['token'] as String)
          .trim()
          .replaceAll('\n', '');
    }

    if (token != null && token.isNotEmpty) {
      Instance.get.token = token;
      var info = await Instance.get.user.info();
      Instance.cfg.set('auth',
          {'token': token.replaceAll('\n', ''), 'username': info.userName});
    } else if (username != null) {
      setCurrentPage(CommandPage.user);

      if (!await login(username, passwd, code)) {
        exit(0);
      }
    }
    var info = await Instance.get.user.info();
    print('欢迎回来！ ${info.name}~');
    Instance.cfg.save();
  }

  @override
  Future<bool> call(String command) async {
    if (command.trim().isEmpty) return false;
    var argv = command.trim().split(' ');
    switch (argv[0]) {
      case '/login':
        {
          String username = '', passwd = '';
          if (argv.length > 1) {
            username = argv[1];
          }
          if (argv.length > 2) {
            passwd = argv[2];
          }
          if (await login(username, passwd)) {
            await Instance.get.user.info();
            page('/page user');
          }
        }
    }
    return true;
  }

  @override
  Future<bool> page(String command) async {
    final commands = command.trim().split(' ');
    UserInfo info = UserInfo();
    if (commands.length > 2 && commands[2].isNotEmpty) {
      info = await Instance.get.getUser(commands[2]);
    } else if (!Instance.get.isLogin) {
      return await login();
    } else {
      info = Instance.get.user.current;
    }

    print!('''
${info.allName}
[${info.userRole}]
\$ ${info.userPoint}
> \x1B[3m${info.userIntro}\x1B[0m
    ''');

    if (Instance.get.isLogin && Instance.get.user.current.userName == info.userName) {
      print!('当前活跃度：${await Instance.get.user.liveness()}');
    }
    return false;
  }

  Future<bool> login(
      [String? username, String? passwd, bool code = true]) async {
    String mfaCode = '';
    if (username == null || username.isEmpty) {
      print!('用户名: ', false);
      username = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
    }
    if (passwd == null || passwd.isEmpty) {
      print!('密码: ', false);
      passwd = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
    }
    if (code) {
      print!('二次验证码: ', false);
      mfaCode =
          stdin.readLineSync(encoding: Encoding.getByName('utf-8')!) ?? '';
    }
    try {
      await Instance.get
          .login(LoginData(
        username: username ?? '',
        passwd: passwd ?? '',
        mfaCode: mfaCode,
      ))
          .then((value) async {
        String token = value.trim();
        Instance.cfg.set('auth', {'token': token, 'username': username});
      }).catchError((err) {
        exit(0);
      });
    } catch (e) {
      print!('登录失败: $e');
      return false;
    }
    return true;
  }
}
