
import 'base.dart';

class ChatRoomCmd implements CommandRegister {
  @override
  ArgParser command(ArgParser parser) {
    return parser;
  }

  @override
  Future<void> exec(ArgResults args) async {
    Instance.get.chatroom.addListener((msg) => print(msg));
    Instance.get.chatroom.reconnect();
  }
}