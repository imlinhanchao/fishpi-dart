import 'package:fishpi/fishpi.dart';
import 'package:fishpi/src/request.dart';

class User {
  String _apiKey = '';

  String get token => _apiKey;

  void setToken(String token) {
    _apiKey = token;
  }

  /// 查询登录用户信息
  Future<UserInfo> info() async {
    try {
      var rsp = await Request.get('api/user', params: {'apiKey': _apiKey});

      if (rsp['code'] != 0) return Future.error(rsp['msg']);

      return UserInfo.from(rsp['data']);
    } catch (e) {
      return Future.error(e);
    }
  }

  /// 查询登录用户常用表情
  ///
  /// 返回常用表情列表
  Future<List<String>> emotions() async {
    try {
      var rsp =
          await Request.get('users/emotions', params: {'apiKey': _apiKey});

      if (rsp['code'] != 0) return Future.error(rsp['msg']);

      return (rsp.data as Map<String, dynamic>).keys.toList();
    } catch (e) {
      return Future.error(e);
    }
  }

  /// 查询登录用户当前活跃度，请求频率请控制在 30 ~ 60 秒一次
  ///
  /// 返回活跃度
  Future<int> liveness() async {
    if (_apiKey.isEmpty) {
      return 0;
    }
    try {
      var rsp = await Request.get('user/liveness', params: {'apiKey': _apiKey});

      return rsp['liveness'] ?? 0;
    } catch (e) {
      return Future.error(e);
    }
  }

  /// 检查登录用户是否已经签到
  ///
  /// 返回是否已经签到
  Future<bool> isCheckIn() async {
    if (_apiKey.isEmpty) {
      return false;
    }
    try {
      var rsp =
          await Request.get('user/checkedIn', params: {'apiKey': _apiKey});

      return rsp['checkedIn'] ?? false;
    } catch (e) {
      return Future.error(e);
    }
  }

  /// 检查登录用户是否已经领取昨日活跃奖励
  ///
  /// 返回是否已经领取昨日活跃奖励
  Future<bool> isCollectedLiveness() async {
    if (_apiKey.isEmpty) {
      return false;
    }
    try {
      var rsp = await Request.get('api/activity/is-collected-liveness',
          params: {'apiKey': _apiKey});

      return rsp['isCollectedYesterdayLivenessReward'] ?? false;
    } catch (e) {
      return Future.error(e);
    }
  }

  /// 领取昨日活跃度奖励
  ///
  /// 返回领取的奖励积分
  Future<int> rewardLiveness() async {
    if (_apiKey.isEmpty) {
      return 0;
    }
    try {
      var rsp = await Request.get('activity/yesterday-liveness-reward-api',
          params: {'apiKey': _apiKey});

      return rsp['sum'] ?? 0;
    } catch (e) {
      return Future.error(e);
    }
  }

  /// 转账
  ///
  /// - `userName` 转账目标用户名
  /// - `amount` 转账金额
  /// - `memo` 转账备注
  /// 返回 code 0 为成功，失败则有 msg
  Future<ResponseResult> transfer(
      String userName, int amount, String memo) async {
    try {
      var rsp = await Request.post('point/transfer', data: {
        'apiKey': _apiKey,
        'userName': userName,
        'amount': amount,
        'memo': memo,
      });

      return ResponseResult.from(rsp);
    } catch (e) {
      return Future.error(e);
    }
  }
}
