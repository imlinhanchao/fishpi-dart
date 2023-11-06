import 'dart:io';

import 'base.dart';

class ChatRoomCmd implements CommandInstance {
  @override
  ArgParser command(ArgParser parser) {
    return parser..addOption('talk', help: 'Talk to chatroom');
  }

  @override
  Future<void> exec(ArgResults args, void Function(dynamic msg) print) async {
    if (args['talk'] != null) {
      Instance.get.chatroom.send(args['talk']).then(print);
      exit(0);
    }
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

  @override
  Future<bool> call(String command) async {
    return false;
  }

  @override
  Future<bool> page(String command) async {
    return false;
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
