import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:fishpi/src/request.dart';
import 'package:fishpi/src/types.dart';

String toMD5(String src) {
  var content = const Utf8Encoder().convert(src);
  var digest = md5.convert(content);
  return hex.encode(digest.bytes);
}

Metal analyzeMetalAttr(m) {
  if (!m) return m;
  if (m['attr'] is! String) return m;
  var attr = m['attr'].split('&');
  var src = m.attr;
  m['attr'] = {"src": src};
  attr.forEach((a) => m['attr'][a.split('=')[0]] = a.split('=')[1]);
  m['url'] = '${Request.origin}/gen?txt=${m['description']}&url=$src';
  m['icon'] = '${Request.origin}/gen?txt=&$src';
  return Metal(m);
}

MetalList toMetal(String sysMetal) {
  try {
    var metal = json.decode(sysMetal);
    MetalList list = [];
    metal['list'].forEach((m) => {
      list.add(analyzeMetalAttr(m))
    });
    return list;
  } catch (error) {
    return [];
  }
}
