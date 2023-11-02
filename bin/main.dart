import 'src/instance.dart';
import 'src/auth.dart';
import 'src/utils.dart';

void main(List<String> arguments) async {
  var commands = [
    AuthCmd(),
    UtilsCmd(),
  ];
  var parser = registerCommand(commands);
  final args = parser.parse(arguments);

  for (var element in commands) {
    element.exec(args);
  }
}
