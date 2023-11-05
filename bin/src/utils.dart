import 'dart:convert';

import 'base.dart';

class UtilsCmd implements CommandRegister {
  @override
  ArgParser command(ArgParser parser) {
    return parser
      ..addOption('upload', abbr: 'f', help: 'upload file path')
      ..addOption('origin',
          abbr: 'o', help: 'Server origin', defaultsTo: 'https://fishpi.cn');
  }

  @override
  Future<void> exec(ArgResults args, void Function(dynamic msg) print) async {
    var upload = args['upload'];
    var origin = args['origin'];

    if (origin != null) {
      Fishpi.setOrigin(args['origin']);
    }

    if (upload != null) {
      var files = upload.split(',');
      await Instance.get
          .upload(files)
          .then((value) => print(json.encode(value.toJson())))
          .catchError((err) => print(json.encode({'error': err})));
    }
  }
}
