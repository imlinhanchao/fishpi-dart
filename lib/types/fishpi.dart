// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:fishpi/src/utils.dart';

export 'user.dart';
export 'chatroom.dart';
export 'chat.dart';
export 'redpacket.dart';
export 'breezemoon.dart';
export 'notice.dart';
export 'article.dart';

class ApiResponse<T> {
  /// 请求状态
  int code = 0;

  /// 请求状态
  int? result;

  /// 请求信息
  String? msg;

  /// 请求数据
  T? data;

  ApiResponse.from(Map<String, dynamic> rsp, Function T) {
    code = rsp['code'] ?? '';
    result = rsp['result'] ?? '';
    msg = rsp['msg'] ?? '';
    data = rsp['data'] != null ? T(rsp['data']) : null;
  }

  @override
  toString() {
    return "{ code=$code, result=$result, msg=$msg, data=$data }";
  }
}

class LoginData {
  /// 用户名
  String username;

  /// 密码
  String passwd;

  /// 二次验证码
  String? mfaCode;

  LoginData({
    this.username = '',
    this.passwd = '',
    this.mfaCode,
  });

  LoginData.from(Map<String, dynamic> data)
      : username = data['username'] ?? '',
        passwd = data['passwd'] ?? '',
        mfaCode = data['mfaCode'];

  toJson() => {
        'nameOrEmail': username,
        'userPassword': passwd.toMD5(),
        'mfaCode': mfaCode ?? ''
      };

  @override
  toString() {
    return "LoginData{username=$username, passwd=$passwd, mfaCode=$mfaCode}";
  }
}

class PreRegisterInfo {
  /// 用户名
  String username;

  /// 手机号
  String phone;

  /// 邀请码
  String? invitecode;

  /// 验证码
  String captcha;

  PreRegisterInfo({
    this.username = '',
    this.phone = '',
    this.invitecode,
    this.captcha = '',
  });

  PreRegisterInfo.from(Map<String, dynamic> data)
      : username = data['username'] ?? '',
        phone = data['phone'] ?? '',
        invitecode = data['invitecode'] ?? '',
        captcha = data['captcha'] ?? '';

  toJson() => {
        'userName': username,
        'userPhone': phone,
        'invitecode': invitecode ?? '',
        'captcha': captcha
      };

  @override
  toString() {
    return "PreRegisterInfo{username=$username, phone=$phone, invitecode=$invitecode, captcha=$captcha}";
  }
}

class ResponseResult {
  bool success;
  String msg;

  ResponseResult({
    this.success = false,
    this.msg = '',
  });

  ResponseResult.from(Map<String, dynamic> data)
      : success = (data['code'] ?? 0) == 0,
        msg = data['msg'] ?? '';

  @override
  String toString() {
    return "ResponseResult{ success=$success, msg=$msg }";
  }
}

class FileInfo {
  /// 文件名
  String filename;

  /// 文件地址
  String url;

  FileInfo({this.filename = '', this.url = ''});

  FileInfo.from(Map<String, dynamic> data)
      : filename = data['filename'] ?? '',
        url = data['url'] ?? '';

  @override
  toString() {
    return "FileInfo{filename=$filename, url=$url}";
  }
}

class UploadResult {
  /// 上传失败文件
  List<String> errFiles;

  /// 上传成功文件
  List<FileInfo> succFiles;

  UploadResult({this.errFiles = const [], this.succFiles = const []});

  UploadResult.from(Map<String, dynamic> map)
      : errFiles = List<String>.from(map['errFiles'] ?? []),
        succFiles = ((map['succMap'] ?? {}) as Map<String, dynamic>)
            .entries
            .map((entry) => FileInfo(filename: entry.key, url: entry.value))
            .toList();

  toJson() => {
        'errFiles': errFiles,
        'succMap': succFiles
            .map((e) => {
                  'filename': e.filename,
                  'url': e.url,
                })
            .toList()
      };

  @override
  toString() {
    return "UploadResult{ errFiles=${errFiles.join(',')}, succFiles=$succFiles }";
  }
}

class RegisterInfo {
  /// 用户角色
  String role;

  /// 用户密码
  String passwd;

  /// 用户 Id
  String userId;

  /// 邀请人用户名
  String? r;

  RegisterInfo({
    this.role = '0',
    this.passwd = '',
    this.userId = '',
    this.r,
  });

  RegisterInfo.from(Map<String, dynamic> data)
      : role = data['role'] ?? '',
        passwd = data['passwd'] ?? '',
        userId = data['userId'] ?? '',
        r = data['r'];

  toJson() => {
        'userAppRole': role,
        'userPassword': passwd.toMD5(),
        'userId': userId,
        'r': r ?? '',
      };

  @override
  toString() {
    return 'RegisterInfo{role: $role, passwd: $passwd, userId: $userId, r: $r}';
  }
}

class AtUser {
  /// 用户名
  String userName;

  /// 用户头像
  String userAvatarURL;

  /// 全小写用户名
  String userNameLowerCase;

  AtUser({
    this.userName = '',
    this.userAvatarURL = '',
    this.userNameLowerCase = '',
  });

  AtUser.from(Map<String, dynamic> data)
      : userName = data['userName'] ?? '',
        userAvatarURL = data['userAvatarURL'] ?? '',
        userNameLowerCase = data['userNameLowerCase'] ?? '';

  toJson() => {
        'userName': userName,
        'userAvatarURL': userAvatarURL,
        'userNameLowerCase': userNameLowerCase,
      };

  @override
  toString() {
    return 'AtUser{userName: $userName, userAvatarURL: $userAvatarURL, userNameLowerCase: $userNameLowerCase}';
  }
}

typedef AtUserList = List<AtUser>;

class UserLite {
  String userNickname;
  String userName;

  UserLite({
    this.userName = '',
    this.userNickname = '',
  });

  UserLite.from(Map<String, dynamic> data)
      : userNickname = data['userNickname'] ?? '',
        userName = data['userName'] ?? '';

  toJson() => {
        'userNickname': userNickname,
        'userName': userName,
      };

  @override
  toString() {
    return 'UserLite{userNickname: $userNickname, userName: $userName}';
  }
}

/// 举报数据类型
enum ReportDataType {
  /// 文章
  article,

  /// 评论
  comment,

  /// 用户
  user,

  /// 聊天消息
  chatroom,
}

/// 举报类型
enum ReportType {
  /// 垃圾广告
  advertise,

  /// 色情
  porn,

  /// 违规
  violate,

  /// 侵权
  infringement,

  /// 人身攻击
  attacks,

  /// 冒充他人账号
  impersonate,

  /// 垃圾广告账号
  advertisingAccount,

  /// 违规泄露个人信息
  leakPrivacy,

  /// 其它
  other,
}

/// 举报数据
class Report {
  /// 举报对象的 oId
  String reportDataId;

  /// 举报数据的类型
  ReportDataType reportDataType = ReportDataType.chatroom;

  /// 举报的类型
  ReportType reportType = ReportType.advertise;

  /// 举报的理由
  String reportMemo = '';

  Report({
    required this.reportDataId,
    this.reportDataType = ReportDataType.chatroom,
    this.reportType = ReportType.advertise,
    required this.reportMemo,
  });

  Report.from(Map<String, dynamic> json)
      : reportDataId = json['reportDataId'] ?? '',
        reportDataType = ReportDataType.values[json['reportDataType'] ?? 3],
        reportType = ReportType.values[json['reportType'] ?? 0],
        reportMemo = json['reportMemo'] ?? '';

  toJson() => {
        'reportDataId': reportDataId,
        'reportDataType': reportDataType.index,
        'reportType': reportType.index,
        'reportMemo': reportMemo,
      };

  @override
  toString() {
    return 'Report{reportDataId: $reportDataId, reportDataType: $reportDataType, reportType: $reportType, reportMemo: $reportMemo}';
  }
}

class Log {
  /// 操作时间
  String key1;

  /// IP
  String key2;

  /// 内容
  String data;

  /// 是否公开
  bool isPublic;

  /// 操作类型
  String key3;

  /// 唯一标识
  String oId;

  /// 类型
  String type;

  Log({
    this.key1 = '',
    this.key2 = '',
    this.data = '',
    this.isPublic = false,
    this.key3 = '',
    this.oId = '',
    this.type = '',
  });

  Log.from(Map<String, dynamic> json)
      : key1 = json['key1'] ?? '',
        key2 = json['key2'] ?? '',
        data = json['data'] ?? '',
        isPublic = json['public'] ?? false,
        key3 = json['key3'] ?? '',
        oId = json['oId'] ?? '',
        type = json['type'] ?? '';

  toJson() => {
        'key1': key1,
        'key2': key2,
        'data': data,
        'public': isPublic,
        'key3': key3,
        'oId': oId,
        'type': type,
      };

  @override
  toString() {
    return 'Log{key1: $key1, key2: $key2, data: $data, isPublic: $isPublic, key3: $key3, oId: $oId, type: $type}';
  }
}
