import 'package:fishpi/fishpi.dart';

Fishpi fishpi = Fishpi();
void main() async {
  LoginData loginData = LoginData(
    username: 'username',
    passwd: 'password',
    // mfaCode: '123456', // 如果开启了 MFA 验证，需要填写
  );
// 登录
  await fishpi.login(loginData);

// 获取用户信息
  UserInfo info = await fishpi.user.info();
  print(info.toString());

// 监听聊天室
  await fishpi.chatroom.addListener((Message msg) {
    try {
      switch (msg.type) {
        case ChatRoomMessageType.online:
          // 上线消息
          break;
        case ChatRoomMessageType.barrager:
          // 弹幕消息
          break;
        case ChatRoomMessageType.discussChanged:
          // 话题变更
          break;
        case ChatRoomMessageType.msg:
          // 普通消息
          break;
        case ChatRoomMessageType.revoke:
          // 撤回消息
          break;
        case ChatRoomMessageType.redPacket:
          // 红包消息
          break;
        case ChatRoomMessageType.redPacketStatus:
          // 红包领取
          break;
        case ChatRoomMessageType.custom:
          // 自定义消息
          break;
      }
    } catch (e) {
      print('未知异常：$e');
    }
  });

// 发送消息
  await fishpi.chatroom.send('Hello World!');

// 发送弹幕
  await fishpi.chatroom.barrage('Hello World!', color: '#FF0000');

// 发送清风明月
  await fishpi.breezemoon.send('Hello World!');
}
