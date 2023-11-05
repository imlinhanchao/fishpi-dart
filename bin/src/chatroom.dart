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
    var argv = command.split(' ');
    switch (argv[0]) {
      default:
        {
          await Instance.get.chatroom.send(command);
        }
    }
    return true;
  }

  @override
  Future<bool> page(String command) async {
    List<ChatRoomMessage> msgList =
        await Instance.get.chatroom.more(1, type: ChatContentType.Markdown);
    for (var msg in msgList.reversed) {
      print(msgView(msg));
    }
    return true;
  }

  String userNameView(data) {
    final userName = data.userNickname.isEmpty ? '' : '(${data.userName})';
    return '${data.userNickname}($userName)';
  }

  String msgView(ChatRoomMessage msg) {
    if (msg.isRedpacket) return redPacketView(msg);
    return '${userNameView(msg)} [${msg.time}]: ${msg.md}';
  }

  String redPacketView(ChatRoomMessage msg) {
    return '${userNameView(msg)} [${msg.time}]: { 收到一个${RedPacketType.toName(msg.redpacket?.type ?? '')} }';
  }

  String barragerView(BarragerMsg msg) {
    return '<{ ${userNameView(msg)} : ${msg.barragerContent} }>';
  }
}
