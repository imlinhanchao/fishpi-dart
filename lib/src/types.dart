// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:fishpi/src/request.dart';
import 'package:fishpi/src/utils.dart';

export 'types/chatroom.dart';

class ApiResponse<T> {
  /// 请求状态
  int code = 0;

  /// 请求状态
  int? result;

  /// 请求信息
  String? msg;

  /// 请求数据
  T? data;

  ApiResponse(Map<String, dynamic> rsp, Function T) {
    code = rsp['code'];
    result = rsp['result'];
    msg = rsp['msg'];
    data = rsp['data'] != null ? T(rsp['data']) : null;
  }

  @override
  toString() {
    return "{ code=$code, result=$result, msg=$msg, data=$data }";
  }
}

class LoginRsp {
  /// 请求状态
  int code = 0;

  /// 消息
  String msg = '';

  /// Api Key
  String? key;
  LoginRsp(Map<String, dynamic> data) {
    code = data['code'];
    msg = data['msg'];
    key = data['Key'];
  }

  @override
  toString() {
    return "{ code=$code, msg=$msg, key=$key }";
  }
}

class LoginData {
  /// 用户名
  String username = '';

  /// 密码
  String passwd = '';

  /// 二次验证码
  String? mfaCode;

  LoginData(Map<String, dynamic> data) {
    username = data['username'];
    passwd = data['passwd'];
    mfaCode = data['mfaCode'];
  }

  toJson() {
    return {
      'nameOrEmail': username,
      'userPassword': passwd.toMD5(),
      'mfaCode': mfaCode ?? ''
    };
  }
}

class PreRegisterInfo {
  /// 用户名
  String username = '';

  /// 手机号
  String phone = '';

  /// 邀请码
  String? invitecode;

  /// 验证码
  String captcha = '';

  PreRegisterInfo(Map<String, dynamic> data) {
    username = data['username'];
    phone = data['phone'];
    invitecode = data['invitecode'];
    captcha = data['captcha'];
  }

  toJson() {
    return {
      'userName': username,
      'userPhone': phone,
      'invitecode': invitecode ?? '',
      'captcha': captcha
    };
  }
}

class ResponseResult {
  bool success = false;
  String msg = '';

  ResponseResult(Map<String, dynamic> data) {
    success = data['code'] == 0;
    msg = data['msg'];
  }

  @override
  String toString() {
    return "{ success=$success, msg=$msg }";
  }
}

class MetalAttr {
  /// 徽标图地址
  String url = '';

  /// 背景色
  String backcolor = '';

  /// 文字颜色
  String fontcolor = '';

  MetalAttr([Map<String, dynamic>? attr]) {
    url = attr?['url'] ?? '';
    backcolor = attr?['backcolor'] ?? '';
    fontcolor = attr?['fontcolor'] ?? '';
  }

  @override
  toString() {
    return 'url=$url&backcolor=$backcolor&fontcolor=$fontcolor';
  }
}

class MetalBase {
  /// 徽章属性
  MetalAttr attr = MetalAttr();

  /// 徽章名
  String name = '';

  /// 徽章描述
  String description = '';

  /// 徽章数据
  String data = '';

  MetalBase([Map<String, dynamic>? metal]) {
    attr = MetalAttr(metal?['attr']);
    name = metal?['name'] ?? '';
    description = metal?['description'] ?? '';
    data = metal?['data'] ?? '';
  }

  toUrl({includeText = true}) {
    var origin = Request.origin;
    var url = '$origin/gen?txt=$name}&$attr';
    if (!includeText) {
      url = '$origin/gen?txt=&$attr';
    }
    return url;
  }
}

class Metal extends MetalBase {
  /// 完整徽章地址（含文字）
  String? url;

  /// 徽章地址（不含文字）
  String? icon;

  /// 是否佩戴
  String? enable;

  Metal(Map<String, dynamic> metal) : super(metal) {
    url = metal['url'];
    icon = metal['icon'];
    enable = metal['enable'];
  }

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
  String oId = '';

  /// 用户编号
  String userNo = '';

  /// 用户名
  String userName = '';

  /// 昵称
  String userNickname = '';

  /// 首页地址
  String userURL = '';

  /// 所在城市
  String userCity = '';

  /// 签名
  String userIntro = '';

  /// 是否在线
  bool userOnlineFlag = false;

  /// 用户积分
  int userPoint = 0;

  /// 用户组
  String userRole = '';

  /// 角色
  UserAppRole userAppRole = UserAppRole.Hack;

  /// 用户头像地址
  String userAvatarURL = '';

  /// 用户卡片背景
  String cardBg = '';

  /// 用户关注数
  int followingUserCount = 0;

  /// 用户被关注数
  int followerCount = 0;

  /// 在线时长，单位分钟
  int onlineMinute = 0;

  /// 是否已经关注，未登录则为 `hide`
  String canFollow = 'hide';

  /// 用户所有勋章列表，包含未佩戴
  MetalList allMetalOwned = [];

  /// 用户勋章列表
  MetalList sysMetal = [];

  UserInfo([Map? data]) {
    if (data == null) return;
    oId = data['oId'];
    userNo = data['userNo'];
    userName = data['userName'];
    userNickname = data['userNickname'];
    userURL = data['userURL'];
    userCity = data['userCity'];
    userIntro = data['userIntro'];
    userOnlineFlag = data['userOnlineFlag'];
    userPoint = data['userPoint'];
    userRole = data['userRole'];
    userAppRole = {
          "0": UserAppRole.Hack,
          "1": UserAppRole.Artist
        }[data['userAppRole']] ??
        UserAppRole.Hack;
    userAvatarURL = data['userAvatarURL'];
    cardBg = data['cardBg'];
    followingUserCount = data['followingUserCount'];
    followerCount = data['followerCount'];
    onlineMinute = data['onlineMinute'];
    canFollow = data['canFollow'] ?? 'self';
    allMetalOwned =
        data['allMetalOwned'] != null ? toMetal(data['allMetalOwned']) : [];
    sysMetal = data['sysMetal'] != null ? toMetal(data['sysMetal']) : [];
  }

  @override
  String toString() {
    return "{ oId=$oId, userNo=$userNo, userName=$userName, userNickname=$userNickname, userURL=$userURL, userCity=$userCity, userIntro=$userIntro, userOnlineFlag=$userOnlineFlag, userPoint=$userPoint, userRole=$userRole, userAppRole=$userAppRole, userAvatarURL=$userAvatarURL, cardBg=$cardBg, followingUserCount=$followingUserCount, followerCount=$followerCount, onlineMinute=$onlineMinute, canFollow=$canFollow, allMetalOwned=$allMetalOwned, sysMetal=$sysMetal }";
  }
}

class FileInfo {
  /// 文件名
  String filename = '';

  /// 文件地址
  String url = '';

  FileInfo(this.filename, this.url);

  @override
  toString() {
    return "{ filename=$filename, url=$url }";
  }
}

class UploadResult {
  /// 上传失败文件
  List<String> errFiles = [];

  /// 上传成功文件
  List<FileInfo> succFiles = [];

  @override
  toString() {
    return "{ errFiles=${errFiles.join(',')}, succFiles=$succFiles }";
  }
}

class RegisterInfo {
  /// 用户角色
  String role = UserAppRole.Hack.toString();
  /// 用户密码
  String passwd = '';
  /// 用户 Id
  String userId = '';
  /// 邀请人用户名
  String? r;

  RegisterInfo([Map<String, dynamic>? data]) {
    if (data == null) return;
    role = data['role'];
    passwd = data['passwd'];
    userId = data['userId'];
    r = data['r'];
  }

  toJson() {
    return {
      'userAppRole': role,
      'userPassword': passwd.toMD5(),
      'userId': userId,
      'r': r ?? '',
    };
  }
}

class AtUser {
  /// 用户名
  String userName = '';
  /// 用户头像
  String userAvatarURL = '';
  /// 全小写用户名
  String userNameLowerCase = '';

  AtUser([Map<String, dynamic>? data]) {
    if (data == null) return;
    userName = data['userName'];
    userAvatarURL = data['userAvatarURL'];
    userNameLowerCase = data['userNameLowerCase'];
  }
}

typedef AtUserList = List<AtUser>;

class UserLite { 
  String userNickname = ''; 
  String userName = ''; 

  UserLite([Map<String, dynamic>? data]) { 
    if (data == null) return; 
    userNickname = data['userNickname']; 
    userName = data['userName']; 
  }
}