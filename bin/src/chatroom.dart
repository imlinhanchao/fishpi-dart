import 'base.dart';

class ChatRoomCmd implements CommandRegister {
  @override
  ArgParser command(ArgParser parser) {
    return parser;
  }

  @override
  Future<void> exec(ArgResults args, void Function(String msg) print) async {
    Instance.get.chatroom.addListener((msg) {
      switch (msg.type) {
        case ChatRoomMessageType.online:
          break;
        case ChatRoomMessageType.barrager:
          print(barragerView(msg.data));
          break;
        case ChatRoomMessageType.discussChanged:
          break;
        case ChatRoomMessageType.msg:
          print(msgView(msg.data));
          break;
        case ChatRoomMessageType.revoke:
          break;
        case ChatRoomMessageType.redPacket:
          print(redPacketView(msg.data));
          break;
        case ChatRoomMessageType.redPacketStatus:
          break;
        case ChatRoomMessageType.custom:
          break;
      }
    });
    Instance.get.chatroom.reconnect();
  }

  String userNameView(data) {
    final userName = data.userNickname.isEmpty ? '' : '(${data.userName})';
    return '${data.userNickname}($userName)';
  }

  String msgView(ChatRoomMsg msg) {
    return '${userNameView(msg)} [${msg.time}]: ${msg.md}';
  }

  String redPacketView(ChatRoomMsg msg) {
    return '${userNameView(msg)} [${msg.time}]: { 收到一个${RedPacketType.toName(msg.redpacket?.type ?? '')} }';
  }

  String barragerView(BarragerMsg msg) {
    return '<{ ${userNameView(msg)} : ${msg.barragerContent} }>';
  }
}
