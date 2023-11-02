import 'src/instance.dart';
import 'src/auth.dart';

void main(List<String> arguments) async {
  var commands = [
    AuthCmd(),
  ];
  var parser = registerCommand(commands);
  final args = parser.parse(arguments);

  for (var element in commands) {
    element.exec(args);
  }
}
