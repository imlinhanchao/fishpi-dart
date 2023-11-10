import 'package:fishpi/fishpi.dart';
import 'package:fishpi/src/request.dart';

class Breezemoon {
  String token = '';

  Breezemoon([String? token]) {
    this.token = token ?? this.token;
  }

  /// 获取清风明月列表
  ///
  /// - `page` 消息页码
  /// - `size` 每页个数
  Future<List<BreezemoonContent>> list({int page = 1, int size = 20}) async {
    try {
      var rsp = await Request.get('api/breezemoons',
          params: {'p': page, 'size': size});

      if (rsp['code'] != 0) return Future.error(rsp['msg']);

      return List.from(rsp['breezemoons'])
          .map((e) => BreezemoonContent.from(e))
          .toList();
    } catch (e) {
      return Future.error(e);
    }
  }

  /// 发送清风明月
  ///
  /// [content] 内容
  Future<ResponseResult> send(String content) async {
    try {
      var rsp = await Request.post('breezemoon',
          data: {'apiKey': token, 'breezemoonContent': content});

      return ResponseResult.from(rsp);
    } catch (e) {
      return Future.error(e);
    }
  }
}
