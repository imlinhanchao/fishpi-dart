import 'dart:convert';
import 'dart:io';

import 'base.dart';

class AuthCmd implements CommandRegister {
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
    var code = args['code'] ?? Instance.cfg.config['auth']?['code'];
    var passwd = args['passwd'];
    String? mfaCode;

    if (token != null) {
      Instance.get.token = token;
    } else if (args['username'] != null) {
      if (passwd == null) {
        print('Please input your password:');
        passwd = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
      }
      if (code) {
        print('Please input your mfa code:');
        mfaCode = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
      }
      await Instance.get
          .login(LoginData(
            username: username,
            passwd: passwd ?? '',
            mfaCode: mfaCode,
          ))
          .then((value) => {
                print('Login success !'),
                Instance.cfg.set('auth',
                    {'token': token, 'username': username, 'code': code})
              })
          .catchError((err) => {print('Login failed: $err'), exit(0)});
    }
  }
}
