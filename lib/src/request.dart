import 'dart:convert';

import 'package:dio/dio.dart';

class Request {
  static String _domain = 'fishpi.cn';
  static String _protocol = 'https';
  static Future<T> get<T>(String url, {Map<String, dynamic>? params}) async {
    if (params != null) {
      url = '$url?';
      params.forEach((key, value) {
        url += '$key=$value&';
      });
      url = url.substring(0, url.length - 1);
    }
    return request(url, method: 'GET');
  }

  static Future<T> post<T>(String url, data) async {
    return request(url, method: 'POST', data: data);
  }

  static Future<T> request<T>(String url, {method, data}) async {
    try {
      var dio = Dio();
      var response = await dio.request('$_protocol://$_domain/$url',
          data: data, options: Options(method: method));
      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          if (response.data is Map) {
            return response.data;
          } else {
            try {
              return json.decode(response.data);
            } catch (e) {
              return response.data;
            }
          }
        } catch (e) {
          return Future.error('解析响应数据异常');
        }
      } else if (response.statusCode == 401) {
        return Future.error('401');
      } else {
        return Future.error('HTTP错误');
      }
    } catch (e) {
      return Future.error('未知异常');
    }
  }

  static Future<FormData> formData(String key,
      {Map<String, dynamic>? src, List<String>? files, String? value}) async {
    src ??= {};
    if (files != null) {
      src[key] = await Future.wait(files.map((filePath) async {
        return await MultipartFile.fromFile(filePath);
      }));
    } else {
      src[key] = value;
    }
    return FormData.fromMap(src);
  }

  static setDomain({required String domain, protocol = 'https'}) {
    _domain = domain;
    _protocol = protocol;
  }

  static get origin {
    return '$_protocol://$_domain';
  }
}
