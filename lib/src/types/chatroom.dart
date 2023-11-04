// ignore_for_file: non_constant_identifier_names, camel_case_types, constant_identifier_names

import 'dart:convert';

import 'package:fishpi/fishpi.dart';
import 'package:fishpi/src/utils.dart';

/// 客户端类型
class ClientType {
  /// 网页端
  static final Web = 'Web';

  /// PC 端
  static final PC = 'PC';

  /// 移动端聊天室
  static final Mobile = 'Mobile';

  /// Windows 客户端
  static final Windows = 'Windows';

  /// macOS 客户端
  static final macOS = 'macOS';

  /// iOS 客户端
  static final iOS = 'iOS';

  /// Android 客户端
  static final Android = 'Android';

  /// IDEA 插件
  static final IDEA = 'IDEA';

  /// Chrome 插件
  static final Chrome = 'Chrome';

  /// Edge 插件
  static final Edge = 'Edge';

  /// VSCode 插件
  static final VSCode = 'VSCode';

  /// Python 插件
  static final Python = 'Python';

  /// Golang 插件
  static final Golang = 'Golang';

  /// 小冰机器人
  static final IceNet = 'IceNet';

  /// 凌机器人
  static final ElvesOnline = 'ElvesOnline';

  /// 其他插件
  static final Other = 'Other';
}

class ChatSource {
  /// 消息来源
  String client = ClientType.Other;

  /// 消息来源版本
  String version = '';

  ChatSource({String? client, String? version}) {
    this.client = client ?? ClientType.Other;
    this.version = version ?? 'Latest';
  }

  @override
  String toString() {
    return "$client/@$version";
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
  String client = '';

  /// 消息来源解析
  ChatSource via = ChatSource();

  bool get isRedpacket => redpacket != null;

  /// 消息内容
  String content = '';

  /// 红包消息内容
  RedPacketMessage? redpacket;

  /// 发送时间
  String time = '';

  ChatRoomMessage(Map data) {
    oId = data['oId'];
    userName = data['userName'];
    userNickname = data['userNickname'];
    userAvatarURL = data['userAvatarURL'];
    sysMetal = List.from(data['sysMetal']).map((e) => Metal(e)).toList();
    client = data['client'];
    via = clientToVia(data['client']) ?? ChatSource();
    content = data['content'];
    try {
      redpacket = RedPacketMessage(json.decode(data['content']));
      // ignore: empty_catches
    } catch (e) {}
    time = data['time'];
  }

  @override
  String toString() {
    return "{ oId=$oId, userName=$userName, userNickname=$userNickname, userAvatarURL=$userAvatarURL, sysMetal=$sysMetal, client=$client, via=$via, content=$content, redpacket=$redpacket, time=$time }";
  }
}

/// 历史消息类型
class ChatContentType {
  /// 原始 Markdown
  static final Markdown = "md";

  /// 渲染 HTML
  static final HTML = "html";
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
  static final online = "online";

  /// 话题修改
  static final discussChanged = "discussChanged";

  /// 消息撤回
  static final revoke = "revoke";

  /// 消息
  static final msg = "msg";

  /// 红包
  static final redPacket = "redPacket";

  /// 红包状态
  static final redPacketStatus = "redPacketStatus";

  /// 弹幕
  static final barrager = "barrager";

  /// 自定义消息
  static final custom = "customMessage";
}

/// 聊天室消息
class Message {
  /// 消息类型，
  String type = ChatRoomMessageType.msg;

  /// 消息内容
  /// OnlineMsg | discussMsg | RevokeMsg | ChatMsg | RedPacketStatusMsg | BarragerMsg | CustomMsg
  dynamic data;

  Message(this.type, this.data);

  @override
  String toString() {
    return "{ type=$type, data=$data }";
  }
}

// 自定义消息
typedef CustomMsg = String;

/// 弹幕消息
class BarragerMsg {
  /// 用户名
  String userName = '';

  /// 用户昵称
  String userNickname = '';

  /// 弹幕内容
  String barragerContent = '';

  /// 弹幕颜色
  String barragerColor = '';

  /// 用户头像地址
  String userAvatarURL = '';

  /// 用户头像地址 20x20
  String userAvatarURL20 = '';

  /// 用户头像地址 48x48
  String userAvatarURL48 = '';

  /// 用户头像地址 210x210
  String userAvatarURL210 = '';

  BarragerMsg(Map data) {
    userName = data['userName'];
    userNickname = data['userNickname'];
    barragerContent = data['barragerContent'];
    barragerColor = data['barragerColor'];
    userAvatarURL = data['userAvatarURL'];
    userAvatarURL20 = data['userAvatarURL20'];
    userAvatarURL48 = data['userAvatarURL48'];
    userAvatarURL210 = data['userAvatarURL210'];
  }

  @override
  String toString() {
    return "{ userName=$userName, userNickname=$userNickname, barragerContent=$barragerContent, barragerColor=$barragerColor, userAvatarURL=$userAvatarURL, userAvatarURL20=$userAvatarURL20, userAvatarURL48=$userAvatarURL48, userAvatarURL210=$userAvatarURL210 }";
  }
}

/// 在线用户信息
class OnlineInfo {
  /// 用户首页
  String homePage = '';

  /// 用户头像
  String userAvatarURL = '';

  /// 用户名
  String userName = '';

  OnlineInfo(Map data) {
    homePage = data['homePage'];
    userAvatarURL = data['userAvatarURL'];
    userName = data['userName'];
  }

  @override
  String toString() {
    return "{ homePage=$homePage, userAvatarURL=$userAvatarURL, userName=$userName }";
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
  String client = '';

  /// 消息来源解析
  ChatSource via = ChatSource();

  ChatRoomMsg(Map data) {
    oId = data['oId'];
    time = data['time'];
    userOId = data['userOId'].toString();
    userName = data['userName'];
    userNickname = data['userNickname'];
    userAvatarURL = data['userAvatarURL'];
    content = data['content'];
    try {
      redpacket = RedPacket(json.decode(data['content']));
      // ignore: empty_catches
    } catch (e) {}
    md = data['md'] ?? '';
    client = data['client'];
    via = clientToVia(data['client']) ?? ChatSource();
  }

  @override
  String toString() {
    return "{ oId=$oId, time=$time, userOId=$userOId, userName=$userName, userNickname=$userNickname, userAvatarURL=$userAvatarURL, content=$content, redpacket=$redpacket, md=$md, client=$client, via=$via }";
  }
}

/// 猜拳类型
enum GestureType {
  /// 石头
  Rock,

  /// 剪刀
  Scissors,

  /// 布
  Paper,
}

/// 红包类型
class RedPacketType {
  /// 拼手气
  static final Random = "random";

  /// 平分
  static final Average = "average";

  /// 专属
  static final Specify = "specify";

  /// 心跳
  static final Heartbeat = "heartbeat";

  /// 猜拳
  static final RockPaperScissors = "rockPaperScissors";
}

/// 红包数据
class RedPacket {
  /// 红包类型
  String type = RedPacketType.Random;

  /// 红包积分
  int money = 0;

  /// 红包个数
  int count = 0;

  /// 祝福语
  String msg = '';

  /// 接收者，专属红包有效
  List<String>? recivers;

  /// 出拳，猜拳红包有效
  GestureType? gesture;

  RedPacket(Map data) {
    type = data['type'];
    money = data['money'];
    count = data['count'];
    msg = data['msg'];
    try {
      recivers = List.from(data['recivers'] is String
          ? json.decode(data['recivers'])
          : data['recivers']);
      // ignore: empty_catches
    } catch (e) {}
    gesture =
        data['gesture'] != null ? GestureType.values[data['gesture']] : null;
  }

  @override
  String toString() {
    return "{ type=$type, money=$money, count=$count, msg=$msg, recivers=$recivers, gesture=$gesture }";
  }
}

/// 红包领取者信息
class RedPacketGot {
  /// 用户 id
  String userId = '';

  /// 用户名
  String userName = '';

  /// 用户头像
  String avatar = '';

  /// 领取到的积分
  int userMoney = 0;

  /// 领取积分时间
  String time = '';

  RedPacketGot(Map data) {
    userId = data['userId'];
    userName = data['userName'];
    avatar = data['avatar'];
    userMoney = data['userMoney'];
    time = data['time'];
  }

  @override
  String toString() {
    return "{ userId=$userId, userName=$userName, avatar=$avatar, userMoney=$userMoney, time=$time }";
  }
}

/// 红包历史信息
class RedPacketMessage {
  /// 消息类型，固定为 redPacket
  String msgType = '';

  /// 红包数
  int count = 0;

  /// 领取数
  int got = 0;

  /// 内含积分
  int money = 0;

  /// 祝福语
  String msg = '';

  /// 发送者 id
  String senderId = '';

  /// 红包类型
  String interface = '';

  /// 接收者，专属红包有效
  List<String> recivers = [];

  /// 已领取者列表
  List<RedPacketGot> who = [];

  RedPacketMessage(Map data) {
    msgType = data['msgType'];
    count = data['count'];
    got = data['got'];
    money = data['money'];
    msg = data['msg'];
    senderId = data['senderId'];
    interface = data['interface'];
    recivers = List.from(data['recivers'] is String
        ? json.decode(data['recivers'])
        : data['recivers']);
    who = List.from(data['who']).map((e) => RedPacketGot(e)).toList();
  }

  @override
  String toString() {
    return "{ msgType=$msgType, count=$count, got=$got, money=$money, msg=$msg, senderId=$senderId, interface=$interface, recivers=$recivers, who=$who }";
  }
}

/// 红包基本信息
class RedPacketBase {
  /// 数量
  int count = 0;

  /// 猜拳类型
  GestureType? gesture = GestureType.Rock;

  /// 领取数
  int got = 0;

  /// 祝福语
  String msg = '';

  /// 发送者用户名
  String userName = '';

  /// 用户头像
  String userAvatarURL = '';

  RedPacketBase({Map? data}) {
    if (data == null) return;
    count = data['count'];
    gesture =
        data['gesture'] == null ? null : GestureType.values[data['gesture']];
    got = data['got'];
    msg = data['msg'];
    userName = data['userName'];
    userAvatarURL = data['userAvatarURL'];
  }

  @override
  String toString() {
    return "{ count=$count, gesture=$gesture, got=$got, msg=$msg, userName=$userName, userAvatarURL=$userAvatarURL }";
  }
}

/// 红包信息
class RedPacketInfo {
  /// 红包基本信息
  RedPacketBase info = RedPacketBase();

  /// 接收者，专属红包有效
  List<String> recivers = [];

  /// 已领取者列表
  List<RedPacketGot> who = [];

  RedPacketInfo(Map data) {
    info = RedPacketBase(data: data['info']);
    recivers = List.from(data['recivers'] is String
        ? json.decode(data['recivers'])
        : data['recivers']);
    who = List.from(data['who']).map((e) => RedPacketGot(e)).toList();
  }

  @override
  String toString() {
    return "{ info=$info, recivers=$recivers, who=$who }";
  }
}

/// 红包状态信息
class RedPacketStatusMsg {
  /// 对应红包消息 oId
  String oId = '';

  /// 红包个数
  int count = 0;

  /// 已领取数量
  int got = 0;

  /// 发送者信息
  String whoGive = '';

  /// 领取者信息
  String whoGot = '';

  /// 领取者头像 20x20
  String userAvatarURL20 = '';

  /// 领取者头像 48x48
  String userAvatarURL48 = '';

  /// 领取者头像 210x210
  String userAvatarURL210 = '';

  RedPacketStatusMsg(Map data) {
    oId = data['oId'];
    count = data['count'];
    got = data['got'];
    whoGive = data['whoGive'];
    whoGot = data['whoGot'];
    userAvatarURL20 = data['userAvatarURL20'];
    userAvatarURL48 = data['userAvatarURL48'];
    userAvatarURL210 = data['userAvatarURL210'];
  }

  @override
  String toString() {
    return "{ oId=$oId, count=$count, got=$got, whoGive=$whoGive, whoGot=$whoGot, userAvatarURL20=$userAvatarURL20, userAvatarURL48=$userAvatarURL48, userAvatarURL210=$userAvatarURL210 }";
  }
}
