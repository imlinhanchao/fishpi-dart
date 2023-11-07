import 'dart:io';

import 'base.dart';

class ChatRoomCmd implements CommandInstance {
  UserInfo info = UserInfo();
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
    if (Instance.get.isLogin) info = await Instance.get.user.info();
  }

  @override
  Future<bool> call(String command) async {
    if (command.trim().isEmpty) return false;
    var argv = command.split(' ');
    switch (argv[0]) {
      default:
        {
          if (!Instance.get.isLogin) {
            print('请先登录。');
            break;
          }
          if (!Platform.isWindows) {
            await Instance.get.chatroom.send(command);
          } else {
            print('命令发送消息不支援 Windows 端。请使用 --talk 命令行参数发送。');
          }
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
    return data.userNickname.isEmpty ? data.userName : '${data.userNickname}(${data.userName})';
  }

  String msgView(ChatRoomMessage msg) {
    if (msg.isRedpacket) return redPacketView(msg);
    return '${userNameView(msg)} [${msg.time}]: ${htmlToText(msg.content, userName: info.userName).replaceAll('\n', '')}';
  }

  String redPacketView(ChatRoomMessage msg) {
    return '${userNameView(msg)} [${msg.time}]: { 收到一个${RedPacketType.toName(msg.redpacket?.type ?? '')} }';
  }

  String barragerView(BarragerMsg msg) {
    return '<{ ${userNameView(msg)} : ${msg.barragerContent} }>';
  }
}
