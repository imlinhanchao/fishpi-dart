// ignore_for_file: non_constant_identifier_names, camel_case_types, constant_identifier_names

import 'dart:convert';

import 'package:fishpi/fishpi.dart';

/// 客户端类型
class ClientType {
  /// 网页端
  static const Web = 'Web';

  /// PC 端
  static const PC = 'PC';

  /// 移动端聊天室
  static const Mobile = 'Mobile';

  /// Windows 客户端
  static const Windows = 'Windows';

  /// macOS 客户端
  static const macOS = 'macOS';

  /// iOS 客户端
  static const iOS = 'iOS';

  /// Android 客户端
  static const Android = 'Android';

  /// IDEA 插件
  static const IDEA = 'IDEA';

  /// Chrome 插件
  static const Chrome = 'Chrome';

  /// Edge 插件
  static const Edge = 'Edge';

  /// VSCode 插件
  static const VSCode = 'VSCode';

  /// Python 插件
  static const Python = 'Python';

  /// Golang 插件
  static const Golang = 'Golang';

  /// 小冰机器人
  static const IceNet = 'IceNet';

  /// 凌机器人
  static const ElvesOnline = 'ElvesOnline';

  /// 其他插件
  static const Other = 'Other';
}

class ChatSource {
  /// 消息来源
  String client = ClientType.Other;

  /// 消息来源版本
  String version = '';

  ChatSource({this.client = ClientType.Other, this.version = 'lastst'});

  ChatSource.from(String? client) {
    if ((client ?? '').isEmpty) return;
    final via = client!.split('/');
    if (client.length < 2) return;
    client = via[0];
    version = via[1];
  }

  toJson() => {
        'client': client,
        'version': version,
      };

  @override
  String toString() {
    return "$client/$version";
  }
}

/// 聊天室消息
class ChatRoomMessage {
  /// 消息 Id
  String oId = '';

  /// 发送者用户名
  String userName = '';

  /// 用户昵称
  String userNickname = '';

  /// 用户头像
  String userAvatarURL = '';

  /// 用户徽章
  MetalList sysMetal = [];

  /// 消息来源
  String get client => via.toString();

  /// 消息来源结构
  ChatSource via = ChatSource();

  bool get isRedpacket => redpacket != null;

  /// 消息内容
  String content = '';

  /// 红包消息内容
  RedPacketMessage? redpacket;

  /// 发送时间
  String time = '';

  ChatRoomMessage({
    this.oId = '',
    this.userName = '',
    this.userNickname = '',
    this.userAvatarURL = '',
    this.sysMetal = const [],
    ChatSource? via,
    this.content = '',
    this.redpacket,
    this.time = '',
  }) {
    this.via = via ?? ChatSource();
  }

  ChatRoomMessage.from(Map<String, dynamic> data) {
    oId = data['oId'] ?? '';
    userName = data['userName'] ?? '';
    userNickname = data['userNickname'] ?? '';
    userAvatarURL = data['userAvatarURL'] ?? '';
    sysMetal = List.from(data['sysMetal']).map((e) => Metal.from(e)).toList();
    via = ChatSource.from(data['client']);
    content = data['content'];
    try {
      redpacket = RedPacketMessage.from(json.decode(data['content'] ?? 'null'));
      // ignore: empty_catches
    } catch (e) {}
    time = data['time'];
  }

  toJson() => {
        'oId': oId,
        'userName': userName,
        'userNickname': userNickname,
        'userAvatarURL': userAvatarURL,
        'sysMetal': sysMetal.map((e) => e.toJson()).toList(),
        'client': client,
        'content': content,
        'time': time,
        'redpacket': redpacket?.toJson(),
        'isRedpacket': isRedpacket,
        'via': via.toJson(),
      };

  @override
  String toString() {
    return "ChatRoomMessage{ oId=$oId, userName=$userName, userNickname=$userNickname, userAvatarURL=$userAvatarURL, sysMetal=$sysMetal, client=$client, via=$via, content=$content, redpacket=$redpacket, time=$time }";
  }
}

/// 历史消息类型
class ChatContentType {
  /// 原始 Markdown
  static const Markdown = "md";

  /// 渲染 HTML
  static const HTML = "html";
}

/// chatroom get 接口获取 oId 的相关消息类型
enum ChatMessageType {
  /// 前后消息
  Context,

  /// 前面的消息
  Before,

  /// 后面的消息
  After
}

/// 聊天室消息类型
class ChatRoomMessageType {
  /// 在线用户
  static const online = "online";

  /// 话题修改
  static const discussChanged = "discussChanged";

  /// 消息撤回
  static const revoke = "revoke";

  /// 消息
  static const msg = "msg";

  /// 红包
  static const redPacket = "redPacket";

  /// 红包状态
  static const redPacketStatus = "redPacketStatus";

  /// 弹幕
  static const barrager = "barrager";

  /// 自定义消息
  static const custom = "customMessage";
}

/// 聊天室消息
class Message {
  /// 消息类型，
  String type = ChatRoomMessageType.msg;

  /// 消息内容
  /// OnlineMsg | discussMsg | RevokeMsg | ChatRoomMsg | RedPacketStatusMsg | BarragerMsg | CustomMsg
  dynamic data;

  Message(this.type, this.data);

  @override
  String toString() {
    return "Message{ type=$type, data=$data }";
  }
}

typedef ChatroomListener = void Function(Message);

// 自定义消息
typedef CustomMsg = String;

/// 弹幕消息
class BarragerMsg {
  /// 用户名
  String userName;

  /// 用户昵称
  String userNickname;

  /// 弹幕内容
  String barragerContent;

  /// 弹幕颜色
  String barragerColor;

  /// 用户头像地址
  String userAvatarURL;

  /// 用户头像地址 20x20
  String userAvatarURL20;

  /// 用户头像地址 48x48
  String userAvatarURL48;

  /// 用户头像地址 210x210
  String userAvatarURL210;

  BarragerMsg({
    this.userName = '',
    this.userNickname = '',
    this.barragerContent = '',
    this.barragerColor = '',
    this.userAvatarURL = '',
    this.userAvatarURL20 = '',
    this.userAvatarURL48 = '',
    this.userAvatarURL210 = '',
  });

  BarragerMsg.from(Map data)
      : userName = data['userName'] ?? '',
        userNickname = data['userNickname'] ?? '',
        barragerContent = data['barragerContent'] ?? '',
        barragerColor = data['barragerColor'] ?? '',
        userAvatarURL = data['userAvatarURL'] ?? '',
        userAvatarURL20 = data['userAvatarURL20'] ?? '',
        userAvatarURL48 = data['userAvatarURL48'] ?? '',
        userAvatarURL210 = data['userAvatarURL210'] ?? '';

  toJson() => {
        'userName': userName,
        'userNickname': userNickname,
        'barragerContent': barragerContent,
        'barragerColor': barragerColor,
        'userAvatarURL': userAvatarURL,
        'userAvatarURL20': userAvatarURL20,
        'userAvatarURL48': userAvatarURL48,
        'userAvatarURL210': userAvatarURL210,
      };

  @override
  String toString() {
    return "BarragerMsg{ userName=$userName, userNickname=$userNickname, barragerContent=$barragerContent, barragerColor=$barragerColor, userAvatarURL=$userAvatarURL, userAvatarURL20=$userAvatarURL20, userAvatarURL48=$userAvatarURL48, userAvatarURL210=$userAvatarURL210 }";
  }
}

/// 在线用户信息
class OnlineInfo {
  /// 用户首页
  String homePage;

  /// 用户头像
  String userAvatarURL;

  /// 用户名
  String userName;

  OnlineInfo({
    this.homePage = '',
    this.userAvatarURL = '',
    this.userName = '',
  });

  OnlineInfo.from(Map data)
      : homePage = data['homePage'] ?? '',
        userAvatarURL = data['userAvatarURL'] ?? '',
        userName = data['userName'] ?? '';

  toJson() => {
        'homePage': homePage,
        'userAvatarURL': userAvatarURL,
        'userName': userName,
      };

  @override
  String toString() {
    return "OnlineInfo{ homePage=$homePage, userAvatarURL=$userAvatarURL, userName=$userName }";
  }
}

/// 在线用户列表
typedef OnlineMsg = List<OnlineInfo>;

/// 主题修改消息，主题内容
typedef discussMsg = String;

/// 撤回消息，被撤回消息的 oId
typedef RevokeMsg = String;

/// 聊天消息
class ChatRoomMsg {
  /// 消息 oId
  String oId = '';

  /// 消息发送时间
  String time = '';

  /// 用户 Id
  String userOId = '';

  /// 发送者用户名
  String userName = '';

  /// 发送者昵称
  String userNickname = '';

  /// 发送者头像
  String userAvatarURL = '';

  bool get isRedpacket => redpacket != null;

  /// 消息内容
  String content = '';

  /// 红包消息内容
  RedPacket? redpacket;

  /// 消息内容 Markdown
  String md = '';

  /// 消息来源
  String get client => via.toString();

  /// 消息来源解析
  ChatSource via = ChatSource();

  ChatRoomMsg({
    this.oId = '',
    this.time = '',
    this.userOId = '',
    this.userName = '',
    this.userNickname = '',
    this.userAvatarURL = '',
    this.content = '',
    this.redpacket,
    this.md = '',
    ChatSource? via,
  }) {
    this.via = via ?? ChatSource();
  }

  ChatRoomMsg.from(Map data) {
    oId = data['oId'] ?? '';
    time = data['time'] ?? '';
    userOId = data['userOId']?.toString() ?? '';
    userName = data['userName'] ?? '';
    userNickname = data['userNickname'] ?? '';
    userAvatarURL = data['userAvatarURL'] ?? '';
    content = data['content'] ?? '';
    try {
      redpacket = RedPacket.from(json.decode(data['content'] ?? 'null'));
      // ignore: empty_catches
    } catch (e) {}
    md = data['md'] ?? '';
    via = ChatSource.from(data['client']);
  }

  toJson() => {
        'oId': oId,
        'time': time,
        'userOId': userOId,
        'userName': userName,
        'userNickname': userNickname,
        'userAvatarURL': userAvatarURL,
        'content': content,
        'md': md,
        'client': client,
        'via': via.toJson(),
        'redpacket': redpacket?.toJson(),
        'isRedpacket': isRedpacket,
      };

  @override
  String toString() {
    return "ChatRoomMsg{ oId=$oId, time=$time, userOId=$userOId, userName=$userName, userNickname=$userNickname, userAvatarURL=$userAvatarURL, content=$content, redpacket=$redpacket, md=$md, client=$client, via=$via }";
  }
}

class BarrageCost {
  int cost;
  String unit;

  BarrageCost({
    this.cost = 20,
    this.unit = '积分',
  });

  BarrageCost.from(Map data)
      : cost = data['cost'] ?? 20,
        unit = data['unit'] ?? '积分';

  toJson() => {
        'cost': cost,
        'unit': unit,
      };

  @override
  toString() {
    return "BarrageCose{ cost=$cost, unit=$unit }";
  }
}

class MuteItem {
  /// 解除禁言时间戳
  int time;

  /// 用户头像
  String userAvatarURL;

  /// 用户名
  String userName;

  /// 用户昵称
  String userNickname;

  MuteItem({
    required this.time,
    required this.userAvatarURL,
    required this.userName,
    required this.userNickname,
  });

  MuteItem.from(Map<String, dynamic> data)
      : time = data['time'] ?? '',
        userAvatarURL = data['userAvatarURL'] ?? '',
        userName = data['userName'] ?? '',
        userNickname = data['userNickname'] ?? '';

  Map<String, dynamic> toJson() => {
        'time': time,
        'userAvatarURL': userAvatarURL,
        'userName': userName,
        'userNickname': userNickname,
      };

  @override
  String toString() {
    return 'MuteItem{ time: $time, userAvatarURL: $userAvatarURL, userName: $userName, userNickname: $userNickname }';
  }
}
