// ignore_for_file: depend_on_referenced_packages
import 'dart:io';

import 'package:yaml_modify/yaml_modify.dart';
import 'base.dart';

export 'package:fishpi/fishpi.dart';
export 'package:args/args.dart';

class Instance {
  static final Fishpi _fishpi = Fishpi();
  static final Config _config = Config();
  static Fishpi get get => _fishpi;
  static Config get cfg => _config;
}

/// 命令行实例
abstract class CommandInstance {
  /// 注册命令行参数
  ArgParser command(ArgParser parser);

  /// 执行命令行参数
  Future<void> exec(ArgResults args, void Function(dynamic msg) print);

  /// 执行输入命令
  Future<bool> call(String command);

  /// 执行切页命令
  Future<bool> page(String command);
}

ArgParser registerCommand(List<CommandInstance> register) {
  var parser = ArgParser();
  for (var item in register) {
    parser = item.command(parser);
  }
  return parser;
}

class Config {
  Map config = {};
  String path = 'config.yaml';
  Config({this.path = 'config.yaml'}) {
    load();
  }

  Map load() {
    final file = File(path);
    if (!file.existsSync()) {
      return config;
    }
    config = Map.from(loadYaml(file.readAsStringSync()));
    return config;
  }

  Map save() {
    final file = File(path);
    file.writeAsStringSync(toYamlString(config));
    return config;
  }

  Map set(String key, Map<String, dynamic> data) {
    var cfg = Map.from(config[key] ?? {});
    data.forEach((k, v) {
      cfg[k] = v;
    });
    config[key] = cfg;
    return cfg;
  }
}

String htmlToText(String html, {String? userName}) {
  return html
  .replaceAllMapped(RegExp(r'@<a [^>]*?>([^<]*?)</a>'), (match) => '@\x1B[4m${match.group(1)}\x1B[0m')
  .replaceAllMapped(RegExp(r'<a [^>]*?href="([^"]*?)"[^>]*?>([^<]*?)</a>'), (match) => '[${match.group(2)}](${match.group(1)})')
  .replaceAllMapped(RegExp(r'<a [^>]*?>([^<]*?)</a>'), (match) => match.group(1)??'')
  .replaceAllMapped(RegExp(r'<img\s+alt="([^"]*?)"\s+class="emoji"([^>]*?>)'), (match) => '[${match.group(1)}]')
  .replaceAllMapped(RegExp(r'<img\s+src="([^"]*?)"\s+alt="图片表情"([^>]*?>)'), (match) => '[动画表情]')
  .replaceAllMapped(RegExp(r'<img\s+src="([^"]*?)"([^>]*?>)'), (match) => '[图片]')
  .replaceAllMapped(RegExp(r'<audio[^>]*?>.*?<\/audio>'), (match) => '[音乐]')
  .replaceAllMapped(RegExp(r'<video[^>]*?>.*?<\/video>'), (match) => '[视频]')
  .replaceAllMapped(RegExp(r'<(\w+)>(.*?)<\/\1>'), (match) => '<span>${match.group(2)}</span>')
  .replaceAllMapped(RegExp(r'<iframe.*?<\/iframe>'), (match) => '[内联网页]')
  .replaceAllMapped(RegExp(r'<(\/)*[^>]*?>'), (match) => '')
  .replaceAllMapped(RegExp('@$userName'), (match) => '\x1B[7m@\x1B[4m$userName\x1B[0m');
}