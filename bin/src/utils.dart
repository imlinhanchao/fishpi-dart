import 'package:args/args.dart';

import 'instance.dart';

class UtilsCmd implements CommandRegister {
  @override
  ArgParser command(ArgParser parser) {
    return parser..addOption('upload', abbr: 'up', help: 'upload file path');
  }

  @override
  Future<void> exec(ArgResults args) async {
    var upload = args['upload'];

    if (upload != null) {
      var files = upload.split(',');
      await Instance.get
          .upload(files)
          .then((value) => print(value))
          .catchError((err) => print(err));
    }
  }
}
