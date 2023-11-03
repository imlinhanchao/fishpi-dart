import 'dart:io';

import 'package:fishpi/src/request.dart';
import 'package:fishpi/src/types.dart';
import 'package:fishpi/user.dart';
import 'package:fishpi/chatroom.dart';
export 'src/types.dart';

class Fishpi {
  String _apiKey = '';
  User user = User();
  Chatroom chatroom = Chatroom();

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
    chatroom.setToken(_apiKey);
  }

  get isLogin => _apiKey != '';

  /// 登录
  ///
  /// - `data` 登录账密
  ///
  /// 返回用户的 Token
  Future<String> login(LoginData data) async {
    try {
      var rsp = await Request.post('api/getKey', data: data.toJson());

      if (rsp['code'] != 0) return Future.error(rsp['msg']);

      setToken(rsp['Key']);
      return rsp['Key'];
    } catch (e) {
      return Future.error(e);
    }
  }

  static String get captcha => '${Request.origin}/captcha';

  /// 预注册
  ///
  /// - `data` 预注册数据
  ///
  /// 返回预注册结果
  Future<PreRegisterResult> preRegister(PreRegisterInfo data) async {
    try {
      var rsp = await Request.post('register', data: data.toJson());

      return PreRegisterResult(rsp);
    } catch (e) {
      return Future.error(e);
    }
  }

  /// 验证手机验证码
  ///
  /// - `code` 验证码
  ///
  /// 返回用户 ID
  Future<String> verify(String code) async {
    try {
      var rsp = await Request.get('verify', params: {'code': code});

      if (rsp['code'] != 0) return Future.error(rsp['msg']);

      return rsp['userId'];
    } catch (e) {
      return Future.error(e);
    }
  }

  /// 上传文件
  ///
  /// - `files` 文件路径
  ///
  /// 返回上传结果
  Future<UploadResult> upload(List<String> files) async {
    try {
      var notExist = files.where(
        (element) => !File(element).existsSync(),
      );
      if (notExist.isNotEmpty) {
        return Future.error('File not exist: ${notExist.join(',')}');
      }
      var data = await Request.formData('file[]', files: files);
      var rsp = await Request.post('upload', data: data);

      if (rsp['code'] != 0) return Future.error(rsp['msg']);

      var result = UploadResult();
      rsp = rsp['data'];

      result.errFiles = List<String>.from(rsp['errFiles'] as List);
      rsp['succMap'].forEach((key, value) {
        result.succFiles.add(FileInfo(key, value));
      });

      return result;
    } catch (e) {
      return Future.error(e);
    }
  }
}
