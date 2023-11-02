import 'package:fishpi/src/request.dart';
import 'package:fishpi/src/types.dart';
import 'package:fishpi/user.dart';
export 'src/types.dart';

class Fishpi {
  String _apiKey = '';
  User user = User();

  static setOrigin(String? url) {
    if (url == null) return;
    
    var urls = url.split('://');
    var protocol = 'https';
    var domain = '';

    if (urls.length == 1) {
      domain = urls[0];
    } else {
      protocol = urls[0];
      domain = urls[1];
    }
    Request.setDomain(protocol: protocol, domain: domain);
  }

  Fishpi({String token = ''}) {
    setToken(token);
  }

  String get token => _apiKey;

  void setToken(String token) {
    _apiKey = token;
    user.setToken(_apiKey);
  }

  get isLogin => _apiKey != '';

  Future<String> login(LoginData data) async {
    try {
      var rsp = await Request.post('api/getKey', data.toJson());

      if (rsp['code'] != 0) return Future.error(rsp['msg']);

      setToken(rsp['Key']);
      return rsp['Key'];
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<LoginRsp> upload(List<String> files) async {
    try {
      var data = await Request.formData('file[]', files: files);
      var rsp = await Request.post('upload', data);

      if (rsp['code'] != 0) return Future.error(rsp['msg']);

      return rsp;
    } catch (e) {
      return Future.error(e);
    }
  }
}
