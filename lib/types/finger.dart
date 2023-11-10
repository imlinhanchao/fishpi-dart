class MoFishGame {
  String userName;
  String stage;
  int time;

  MoFishGame({
    this.userName = '',
    this.stage = '',
    this.time = 0,
  });

  MoFishGame.from(Map data)
      : userName = data['userName'] ?? '',
        stage = data['stage'] ?? '',
        time = data['time'] ?? 0;

  toJson() => {
        'userName': userName,
        'stage': stage,
        'time': time,
      };

  @override
  String toString() {
    return "MoFishGame{ userName=$userName, stage=$stage, time=$time }";
  }
}

class UserIP {
  String userLatestLoginIp;
  String userId;

  UserIP({
    this.userLatestLoginIp = '',
    this.userId = '',
  });

  UserIP.from(Map data)
      : userLatestLoginIp = data['userLatestLoginIp'] ?? '',
        userId = data['userId'] ?? '';

  toJson() => {
        'userLatestLoginIp': userLatestLoginIp,
        'userId': userId,
      };

  @override
  String toString() {
    return "UserIP{ userLatestLoginIp=$userLatestLoginIp, userId=$userId }";
  }
}

enum UserBagType {
  checkin1day,
  checkin2days,
  patchCheckinCard,
  metalTicket,
}

class UserBag {
  /// 免签卡
  int checkin1day;
  /// 两日免签卡
  int checkin2days;
  /// 补签卡
  int patchCheckinCard;
  /// 摸鱼派一周年纪念勋章领取券
  int metalTicket;

  UserBag({
    this.checkin1day = 0,
    this.checkin2days = 0,
    this.patchCheckinCard = 0,
    this.metalTicket = 0,
  });

  UserBag.from(Map data)
      : checkin1day = data['checkin1day'] ?? 0,
        checkin2days = data['checkin2days'] ?? 0,
        patchCheckinCard = data['patchCheckinCard'] ?? 0,
        metalTicket = data['metalTicket'] ?? 0;
  
  toJson() => {
        'checkin1day': checkin1day,
        'checkin2days': checkin2days,
        'patchCheckinCard': patchCheckinCard,
        'metalTicket': metalTicket,
      };
}
