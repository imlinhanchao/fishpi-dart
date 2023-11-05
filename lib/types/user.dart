// ignore_for_file: constant_identifier_names

import 'package:fishpi/src/request.dart';
import 'package:fishpi/src/utils.dart';

class MetalAttr {
  /// 徽标图地址
  String url;

  /// 背景色
  String backcolor;

  /// 文字颜色
  String fontcolor;

  MetalAttr({
    this.url = '',
    this.backcolor = '',
    this.fontcolor = '',
  });

  MetalAttr.from(Map<String, dynamic>? attr)
      : url = attr?['url'] ?? '',
        backcolor = attr?['backcolor'] ?? '',
        fontcolor = attr?['fontcolor'] ?? '';

  toJson() => {
        'url': url,
        'backcolor': backcolor,
        'fontcolor': fontcolor,
      };

  @override
  toString() {
    return 'url=$url&backcolor=$backcolor&fontcolor=$fontcolor';
  }
}

class MetalBase {
  /// 徽章属性
  MetalAttr attr;

  /// 徽章名
  String name;

  /// 徽章描述
  String description;

  /// 徽章数据
  String data;

  MetalBase({
    required this.attr,
    required this.name,
    required this.description,
    this.data = '',
  });

  MetalBase.from(Map<String, dynamic> metal)
      : attr = MetalAttr.from(metal['attr']),
        name = metal['name'] ?? '',
        description = metal['description'] ?? '',
        data = metal['data'] ?? '';

  toJson() => {
        'attr': attr.toJson(),
        'name': name,
        'description': description,
        'data': data,
      };

  toUrl([includeText = true]) {
    var url = '${Request.origin}/gen?txt=$name}&$attr';
    if (!includeText) {
      url = '${Request.origin}/gen?txt=&$attr';
    }
    return url;
  }
}

class Metal extends MetalBase {
  /// 完整徽章地址（含文字）
  String get url => toUrl();

  /// 徽章地址（不含文字）
  String get icon => toUrl(false);

  /// 是否佩戴
  String? enable;

  Metal({
    required MetalAttr attr,
    required String name,
    required String description,
    String data = '',
    this.enable,
  }) : super(
          attr: attr,
          name: name,
          description: description,
          data: data,
        );

  Metal.from(Map<String, dynamic> metal)
      : enable = metal['enable'],
        super.from(metal);

  @override
  toJson() => {
        ...super.toJson(),
        'enable': enable,
      };

  @override
  toString() {
    return "{ url=$url, icon=$icon, enable=$enable, attr=$attr, name=$name, description=$description, data=$data }";
  }
}

/// 徽章列表
typedef MetalList = List<Metal>;

enum UserAppRole {
  /// 黑客
  Hack,

  /// 画家
  Artist,
}

/// 用户信息
class UserInfo {
  /// 用户 id
  String oId;

  /// 用户编号
  String userNo;

  String get name => userNickname.isEmpty ? userName : userNickname;

  /// 用户名
  String userName;

  /// 昵称
  String userNickname;

  /// 首页地址
  String userURL;

  /// 所在城市
  String userCity;

  /// 签名
  String userIntro;

  /// 是否在线
  bool userOnlineFlag;

  /// 用户积分
  int userPoint;

  /// 用户组
  String userRole;

  /// 角色
  UserAppRole userAppRole;

  /// 用户头像地址
  String userAvatarURL;

  /// 用户卡片背景
  String cardBg;

  /// 用户关注数
  int followingUserCount;

  /// 用户被关注数
  int followerCount;

  /// 在线时长，单位分钟
  int onlineMinute;

  /// 是否已经关注，未登录则为 `hide`
  String canFollow;

  /// 用户所有勋章列表，包含未佩戴
  MetalList allMetalOwned;

  /// 用户勋章列表
  MetalList sysMetal;

  UserInfo({
    this.oId = '',
    this.userNo = '',
    this.userName = '',
    this.userNickname = '',
    this.userURL = '',
    this.userCity = '',
    this.userIntro = '',
    this.userOnlineFlag = false,
    this.userPoint = 0,
    this.userRole = '',
    this.userAppRole = UserAppRole.Hack,
    this.userAvatarURL = '',
    this.cardBg = '',
    this.followingUserCount = 0,
    this.followerCount = 0,
    this.onlineMinute = 0,
    this.canFollow = 'hide',
    this.allMetalOwned = const [],
    this.sysMetal = const [],
  });

  UserInfo.from(Map data)
      : oId = data['oId'] ?? '',
        userNo = data['userNo'] ?? '',
        userName = data['userName'] ?? '',
        userNickname = data['userNickname'] ?? '',
        userURL = data['userURL'] ?? '',
        userCity = data['userCity'] ?? '',
        userIntro = data['userIntro'] ?? '',
        userOnlineFlag = data['userOnlineFlag'] ?? '',
        userPoint = data['userPoint'] ?? '',
        userRole = data['userRole'] ?? '',
        userAppRole = UserAppRole.values[int.parse(data['userAppRole'] ?? '0')],
        userAvatarURL = data['userAvatarURL'] ?? '',
        cardBg = data['cardBg'] ?? '',
        followingUserCount = data['followingUserCount'] ?? '',
        followerCount = data['followerCount'] ?? '',
        onlineMinute = data['onlineMinute'] ?? '',
        canFollow = data['canFollow'] ?? 'self',
        allMetalOwned = toMetal(data['allMetalOwned'] ?? '[]'),
        sysMetal = toMetal(data['sysMetal'] ?? '[]');

  toJson() => {
        'oId': oId,
        'userNo': userNo,
        'userName': userName,
        'userNickname': userNickname,
        'userURL': userURL,
        'userCity': userCity,
        'userIntro': userIntro,
        'userOnlineFlag': userOnlineFlag,
        'userPoint': userPoint,
        'userRole': userRole,
        'userAppRole': userAppRole.index,
        'userAvatarURL': userAvatarURL,
        'cardBg': cardBg,
        'followingUserCount': followingUserCount,
        'followerCount': followerCount,
        'onlineMinute': onlineMinute,
        'canFollow': canFollow,
        'allMetalOwned': allMetalOwned.map((e) => e.toJson()).toList(),
        'sysMetal': sysMetal.map((e) => e.toJson()).toList(),
      };

  @override
  toString() {
    return "{ oId=$oId, userNo=$userNo, userName=$userName, userNickname=$userNickname, userURL=$userURL, userCity=$userCity, userIntro=$userIntro, userOnlineFlag=$userOnlineFlag, userPoint=$userPoint, userRole=$userRole, userAppRole=$userAppRole, userAvatarURL=$userAvatarURL, cardBg=$cardBg, followingUserCount=$followingUserCount, followerCount=$followerCount, onlineMinute=$onlineMinute, canFollow=$canFollow, allMetalOwned=$allMetalOwned, sysMetal=$sysMetal }";
  }
}
