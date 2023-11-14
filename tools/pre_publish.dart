import 'dart:io';

import 'package:yaml_modify/yaml_modify.dart';

Future createVersionCode() async {
  String text = await File("pubspec.yaml").readAsString();
  Map yaml = loadYaml(text);

  File file = File("lib/src/version.g.dart");
  file.writeAsStringSync('''// GENERATED CODE - DO NOT MODIFY BY HAND

const packageVersion = '${yaml['version']}';
''');
}

Future format() async {
  return Process.start('dart', ['format', '.']);
}

Future pre() async {
  await createVersionCode();
  await format();
}
