<p align="center">
  <a href="https://fishpi.cn">
    <img width="200" src="https://github.com/imlinhanchao/fishpi-dart/raw/master/logo.png">
  </a>
</p>

<h1 align="center">摸鱼派 Dart 开发包 & CLI</h1>

摸鱼打工人社区——[摸鱼派](https://fishpi.cn)开放 API 的开发包，包含社区的所有功能接口。同时，内含一个 CLI 客户端。

## 安装

```bash
# 全局安装
dart pub global activate fishpi

# APP 安装
dart pub add fishpi
```

## 使用

### CLI

```bash
CLI 参数：

-f, --upload            上传文件路径
-o, --origin            服务器地址， 默认为 https://fishpi.cn
-u, --username          用户名
-p, --passwd            密码
-t, --token             API Key
    --code              需要二次验证码
    --talk              发送消息到聊天室（需曾经登录过或添加 -u 参数）
    --barrager          发送弹幕到聊天室（需曾经登录过或添加 -u 参数）
    --barrager-color    弹幕颜色
                        (defaults to "#FFFFFF")
-c, --chat              私聊对象
-s, --say               私聊内容
    --breezemoon        发送清风明月
-h, --[no-]help
    --page              切换启动页面
                        [user, chatroom (default), chat, breezemoon, article]
```

进入 CLI 后，输入 `:help` 查看 CLI 内帮助。

### 开发包

```dart
import 'package:fishpi/fishpi.dart';

Fishpi fishpi = Fishpi();

// 登录
await fishpi.login(username: 'username', password: 'password');

// 获取用户信息
await fishpi.user.info();

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
await fishpi.chatroom.sendBarrager('Hello World!', color: '#FF0000');

// 发送清风明月
await fishpi.breezemoon.send('Hello World!');

```
> 更多使用方法请参考 [CLI](./bin)。

## 异常处理

所有方法返回值分为两类：`ResponseResult` 和 其他。若方法本身需要返回数据，则会直接返回数据，若发生异常将会通过 Throw 抛出。而无数据返回，则会通过 `ResponseResult` 返回执行的结果。