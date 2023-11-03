import 'src/base.dart';
import 'src/auth.dart';
import 'src/chatroom.dart';
import 'src/utils.dart';

void main(List<String> arguments) async {
  var commands = [
    UtilsCmd(),
    AuthCmd(),
    ChatRoomCmd(),
  ];
  var parser = registerCommand(commands);
  final args = parser.parse(arguments);

  for (var element in commands) {
    element.exec(args);
  }
}
