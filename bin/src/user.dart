import 'dart:convert';
import 'dart:io';

import '../main.dart';
import 'base.dart';

class UserCmd implements CommandInstance {
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
    String? mfaCode;

    if (username == Instance.cfg.config['auth']?['username'] && token == null && Instance.cfg.config['auth']?['token'] != null) {
      token = (Instance.cfg.config['auth']?['token'] as String).trim().replaceAll('\n', '');
    }

    if (token != null && token.isNotEmpty) {
      Instance.get.token = token;
      var info = await Instance.get.user.info();
      Instance.cfg.set('auth', {'token': token.replaceAll('\n', ''), 'username': info.userName});
    } else if (username != null) {
      setCurrentPage(CommandPage.user);

      if (passwd == null) {
        print('密码: ', false);
        passwd = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
      }
      if (code) {
        print('二次验证码: ', false);
        mfaCode = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
      }
      await Instance.get
          .login(LoginData(
        username: username,
        passwd: passwd ?? '',
        mfaCode: mfaCode,
      ))
          .then((value) async {
        token = value.trim();
        Instance.cfg.set('auth', {'token': token, 'username': username});
      }).catchError((err) {
        print('登录失败: $err');
        exit(0);
      });
    }
    var info = await Instance.get.user.info();
    print('欢迎回来！ ${info.name}~');
    Instance.cfg.save();
  }

  @override
  Future<bool> call(String command) async {
    return false;
  }

  @override
  Future<bool> page(String command) async {
    return false;
  }
}
