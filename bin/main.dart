import 'package:fishpi/fishpi.dart';

void main(List<String> arguments) async {
  Fishpi.setRoot('https://gaypi.cn');
  const key = '';
  var fishpi = Fishpi(token: key);
  if (!fishpi.isLogin) {
    await fishpi
      .login(LoginData({
        'username': '',
        'passwd': '',
      }))
      .then((value) => print(value))
      .catchError((err) => print(err));
  }
  await fishpi.user.info()
    .then((value) => print(value))
    .catchError((err) => print(err));
}
