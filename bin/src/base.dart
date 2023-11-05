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

abstract class CommandRegister {
  ArgParser command(ArgParser parser);
  Future<void> exec(ArgResults args, void Function(dynamic msg) print);
}

ArgParser registerCommand(List<CommandRegister> register) {
  var parser = ArgParser();
  for (var item in register) {
    parser = item.command(parser);
  }
  return parser;
}

class Config {
  Map<String, dynamic> config = {};
  String path = 'config.yaml';
  Config({this.path = 'config.yaml'}) {
    load();
  }

  Map<String, dynamic> load() {
    final file = File(path);
    if (!file.existsSync()) {
      return config;
    }
    config = loadYaml(file.readAsStringSync());
    return config;
  }

  Map<String, dynamic> save() {
    final file = File(path);
    file.writeAsStringSync(toYamlString(config));
    return config;
  }

  Map<String, dynamic> set(String key, Map<String, dynamic> data) {
    var cfg = config[key] ?? {};
    data.forEach((key, value) {
      cfg[key] = value;
    });
    config[key] = cfg;
    return cfg;
  }
}
