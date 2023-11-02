import 'package:fishpi/fishpi.dart';
import 'package:args/args.dart';

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption('username', abbr: 'u', help: 'Your User Name')
    ..addOption('passwd', abbr: 'p', help: 'Your Password')
    ..addOption('mfaCode', abbr: 'm', help: 'Your mfa Code')
    ..addOption('token', abbr: 't', help: 'Your Api Key')
    ..addOption('origin', abbr: 'o', help: 'Connect Server Origin, for example: https://gaypi.cn', defaultsTo: 'https://gaypi.cn');

  final args = parser.parse(arguments);

  Fishpi.setOrigin(args['origin']);
  var key = args['token']??'';
  var fishpi = Fishpi(token: key);
  if (!fishpi.isLogin) {
    await fishpi
      .login(LoginData({
        'username': args['username']??'',
        'passwd': args['passwd']??'',
        'mfaCode': args['mfaCode']??'',
      }))
      .then((value) => print(value))
      .catchError((err) => print(err));
  }
  await fishpi.user.info()
    .then((value) => print(value))
    .catchError((err) => print(err));
}
