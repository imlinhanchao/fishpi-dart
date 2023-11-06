import 'dart:convert';
import 'dart:io';

import 'base.dart';

class UserCmd implements CommandInstance {
  @override
  ArgParser command(ArgParser parser) {
    return parser
      ..addOption('username', abbr: 'u', help: 'Your User Name')
      ..addOption('passwd', abbr: 'p', help: 'Your Password')
      ..addOption('token', abbr: 't', help: 'Your Token')
      ..addFlag('code', negatable: false, help: 'Need mfa Code to login');
  }

  @override
  Future<void> exec(ArgResults args, void Function(dynamic msg) print) async {
    var token = args['token'] ?? Instance.cfg.config['auth']?['token'];
    var username = args['username'] ?? Instance.cfg.config['auth']?['username'];
    var code = args['code'];
    var passwd = args['passwd'];
    String? mfaCode;

    if (token != null) {
      Instance.get.token = token;
      Instance.cfg.set('auth', {'token': token});
    } else if (args['username'] != null) {
      if (passwd == null) {
        print('密码:');
        passwd = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
      }
      if (code) {
        print('二次验证码:');
        mfaCode = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
      }
      await Instance.get
          .login(LoginData(
        username: username,
        passwd: passwd ?? '',
        mfaCode: mfaCode,
      ))
          .then((value) async {
        var info = await Instance.get.user.info();
        print('欢迎回来！ ${info.name}~');
        Instance.cfg.set('auth', {'token': token, 'username': username});
      }).catchError((err) {
        print('登录失败: $err');
        exit(0);
      });
    }
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
