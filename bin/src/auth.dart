import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:fishpi/fishpi.dart';

import 'instance.dart';

class AuthCmd implements CommandRegister {
  @override
  ArgParser command(ArgParser parser) {
    return parser
      ..addOption('username', abbr: 'u', help: 'Your User Name')
      ..addOption('passwd', abbr: 'p', help: 'Your Password')
      ..addOption('mfaCode', abbr: 'm', help: 'Your mfa Code')
      ..addOption('token', abbr: 't', help: 'Your Token');
  }

  @override
  Future<void> exec(ArgResults args) async {
    var token = args['token'];
    var username = args['username'];
    var mfaCode = args['mfaCode'];
    var passwd = args['passwd'];

    if (token != null) {
      Instance.get.setToken(token);
    } else if (args['username'] != null) {
      if (passwd == null) {
        print('Please input your password:');
        passwd = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
      }
      await Instance.get
          .login(LoginData({
            'username': username,
            'passwd': passwd ?? '',
            'mfaCode': mfaCode ?? '',
          }))
          .then((value) => print(value))
          .catchError((err) => print(err));
    }
  }
}
