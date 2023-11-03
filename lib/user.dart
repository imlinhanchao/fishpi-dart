import 'package:fishpi/fishpi.dart';
import 'package:fishpi/src/request.dart';

class User {
  String _apiKey = '';

  void setToken(String token) {
    _apiKey = token;
  }

  Future<UserInfo> info() async {
    try {
      var rsp = await Request.get('api/user', params: {'apiKey': _apiKey});

      if (rsp['code'] != 0) return Future.error(rsp['msg']);

      return UserInfo(rsp['data']);
    } catch (e) {
      return Future.error(e);
    }
  }
}
