import 'fishpi.dart';

/// 数据类型
class DataType {
  /// 文章
  static const article = 0;

  /// 评论
  static const comment = 1;

  /// @
  static const at = 2;

  /// 被评论
  static const commented = 3;

  /// 关注者
  static const followingUser = 4;

  /// 积分 - 充值
  static const pointCharge = 5;

  /// 积分 - 转账
  static const pointTransfer = 6;

  /// 积分 - 文章打赏
  static const pointArticleReward = 7;

  /// 积分 - 评论感谢
  static const pointCommentThank = 8;

  /// 同城广播
  static const broadcast = 9;

  /// 积分 - 交易
  static const pointExchange = 10;

  /// 积分 - 滥用扣除
  static const abusePointDeduct = 11;

  /// 积分 - 文章被感谢
  static const pointArticleThank = 12;

  /// 回复
  static const reply = 13;

  /// 使用邀请码
  static const invitecodeUsed = 14;

  /// 系统公告 - 文章
  static const sysAnnounceArticle = 15;

  /// 系统公告 - 新用户
  static const sysAnnounceNewUser = 16;

  /// 新的关注者
  static const newFollower = 17;

  /// 邀请链接
  static const invitationLinkUsed = 18;

  /// 系统通知 - 角色变化
  static const sysAnnounceRoleChanged = 19;

  /// 关注的文章更新
  static const followingArticleUpdate = 20;

  /// 关注的文章评论
  static const followingArticleComment = 21;

  /// 积分 - 文章优选
  static const pointPerfectArticle = 22;

  /// 文章新的被关注者
  static const articleNewFollower = 23;

  /// 文章新的关注者
  static const articleNewWatcher = 24;

  /// 评论点赞
  static const commentVoteUp = 25;

  /// 评论点踩
  static const commentVoteDown = 26;

  /// 文章被点赞
  static const articleVoteUp = 27;

  /// 文章被点踩
  static const articleVoteDown = 28;

  /// 积分 - 评论被接受
  static const pointCommentAccept = 33;

  /// 积分 - 举报处理
  static const pointReportHandled = 36;

  /// 聊天室 @
  static const chatRoomAt = 38;

  /// 专属红包提醒
  static const redPacket = 39;
}

/// 通知数
class NoticeCount {
  /// 用户是否启用 Web 通知
  bool userNotifyStatus;

  /// 未读通知数
  int unreadNotificationCnt;

  /// 未读回复通知数
  int unreadReplyNotificationCnt;

  /// 未读积分通知数
  int unreadPointNotificationCnt;

  /// 未读 @ 通知数
  int unreadAtNotificationCnt;

  /// 未读同城通知数
  int unreadBroadcastNotificationCnt;

  /// 未读系统通知数
  int unreadSysAnnounceNotificationCnt;

  /// 未读关注者通知数
  int unreadNewFollowerNotificationCnt;

  /// 未读关注通知数
  int unreadFollowingNotificationCnt;

  /// 未读评论通知数
  int unreadCommentedNotificationCnt;

  NoticeCount({
    required this.userNotifyStatus,
    required this.unreadNotificationCnt,
    required this.unreadReplyNotificationCnt,
    required this.unreadPointNotificationCnt,
    required this.unreadAtNotificationCnt,
    required this.unreadBroadcastNotificationCnt,
    required this.unreadSysAnnounceNotificationCnt,
    required this.unreadNewFollowerNotificationCnt,
    required this.unreadFollowingNotificationCnt,
    required this.unreadCommentedNotificationCnt,
  });

  NoticeCount.from(Map<String, dynamic> data)
      : userNotifyStatus = data['userNotifyStatus'] ?? false,
        unreadNotificationCnt = data['unreadNotificationCnt'] ?? 0,
        unreadReplyNotificationCnt = data['unreadReplyNotificationCnt'] ?? 0,
        unreadPointNotificationCnt = data['unreadPointNotificationCnt'] ?? 0,
        unreadAtNotificationCnt = data['unreadAtNotificationCnt'] ?? 0,
        unreadBroadcastNotificationCnt =
            data['unreadBroadcastNotificationCnt'] ?? 0,
        unreadSysAnnounceNotificationCnt =
            data['unreadSysAnnounceNotificationCnt'] ?? 0,
        unreadNewFollowerNotificationCnt =
            data['unreadNewFollowerNotificationCnt'] ?? 0,
        unreadFollowingNotificationCnt =
            data['unreadFollowingNotificationCnt'] ?? 0,
        unreadCommentedNotificationCnt =
            data['unreadCommentedNotificationCnt'] ?? 0;

  toJson() => {
        'userNotifyStatus': userNotifyStatus,
        'unreadNotificationCnt': unreadNotificationCnt,
        'unreadReplyNotificationCnt': unreadReplyNotificationCnt,
        'unreadPointNotificationCnt': unreadPointNotificationCnt,
        'unreadAtNotificationCnt': unreadAtNotificationCnt,
        'unreadBroadcastNotificationCnt': unreadBroadcastNotificationCnt,
        'unreadSysAnnounceNotificationCnt': unreadSysAnnounceNotificationCnt,
        'unreadNewFollowerNotificationCnt': unreadNewFollowerNotificationCnt,
        'unreadFollowingNotificationCnt': unreadFollowingNotificationCnt,
        'unreadCommentedNotificationCnt': unreadCommentedNotificationCnt,
      };

  @override
  toString() =>
      "NoticeCount{userNotifyStatus=$userNotifyStatus, unreadNotificationCnt=$unreadNotificationCnt, unreadReplyNotificationCnt=$unreadReplyNotificationCnt, unreadPointNotificationCnt=$unreadPointNotificationCnt, unreadAtNotificationCnt=$unreadAtNotificationCnt, unreadBroadcastNotificationCnt=$unreadBroadcastNotificationCnt, unreadSysAnnounceNotificationCnt=$unreadSysAnnounceNotificationCnt, unreadNewFollowerNotificationCnt=$unreadNewFollowerNotificationCnt, unreadFollowingNotificationCnt=$unreadFollowingNotificationCnt, unreadCommentedNotificationCnt=$unreadCommentedNotificationCnt}";
}

/// 积分通知
class NoticePoint {
  /// 通知 id
  String oId;

  /// 数据 id
  String dataId;

  /// 用户 id
  String userId;

  /// 数据类型
  int dataType;

  /// 通知描述
  String description;

  /// 是否已读
  bool hasRead;

  /// 创建日期
  String createTime;

  NoticePoint({
    this.oId = '',
    this.dataId = '',
    this.userId = '',
    this.dataType = 0, // Assuming DataType.DEFAULT as default value
    this.description = '',
    this.hasRead = false,
    this.createTime = '',
  });

  NoticePoint.from(Map<String, dynamic> data)
      : oId = data['oId'] ?? '',
        dataId = data['dataId'] ?? '',
        userId = data['userId'] ?? '',
        dataType = data['dataType'] ??
            0, // Assuming DataType is an enum and 0 is the default value
        description = data['description'] ?? '',
        hasRead = data['hasRead'] ?? false,
        createTime = data['createTime'] ?? '';

  Map<String, dynamic> toJson() => {
        'oId': oId,
        'dataId': dataId,
        'userId': userId,
        'dataType': dataType,
        'description': description,
        'hasRead': hasRead,
        'createTime': createTime,
      };

  @override
  String toString() {
    return 'NoticePoint{oId: $oId, dataId: $dataId, userId: $userId, dataType: $dataType, description: $description, hasRead: $hasRead, createTime: $createTime}';
  }
}

/// 评论/回帖通知
class NoticeComment {
  /// 通知 id
  String oId;

  /// 文章标题
  String commentArticleTitle;

  /// 文章作者
  String commentAuthorName;

  /// 作者头像
  String commentAuthorThumbnailURL;

  /// 文章类型
  int commentArticleType;

  /// 是否精选
  int commentArticlePerfect;

  /// 评论内容
  String commentContent;

  /// 评论地址
  String commentSharpURL;

  /// 是否已读
  bool hasRead;

  /// 评论时间
  String commentCreateTime;

  NoticeComment({
    this.oId = '',
    this.commentArticleTitle = '',
    this.commentAuthorName = '',
    this.commentAuthorThumbnailURL = '',
    this.commentArticleType = 0,
    this.commentArticlePerfect = 0,
    this.commentContent = '',
    this.commentSharpURL = '',
    this.hasRead = false,
    this.commentCreateTime = '',
  });

  NoticeComment.from(Map<String, dynamic> data)
      : oId = data['oId'] ?? '',
        commentArticleTitle = data['commentArticleTitle'] ?? '',
        commentAuthorName = data['commentAuthorName'] ?? '',
        commentAuthorThumbnailURL = data['commentAuthorThumbnailURL'] ?? '',
        commentArticleType = data['commentArticleType'] ?? 0,
        commentArticlePerfect = data['commentArticlePerfect'] ?? 0,
        commentContent = data['commentContent'] ?? '',
        commentSharpURL = data['commentSharpURL'] ?? '',
        hasRead = data['hasRead'] ?? false,
        commentCreateTime = data['commentCreateTime'] ?? '';

  Map<String, dynamic> toJson() => {
        'oId': oId,
        'commentArticleTitle': commentArticleTitle,
        'commentAuthorName': commentAuthorName,
        'commentAuthorThumbnailURL': commentAuthorThumbnailURL,
        'commentArticleType': commentArticleType,
        'commentArticlePerfect': commentArticlePerfect,
        'commentContent': commentContent,
        'commentSharpURL': commentSharpURL,
        'hasRead': hasRead,
        'commentCreateTime': commentCreateTime,
      };

  @override
  String toString() {
    return 'NoticeComment{oId: $oId, commentArticleTitle: $commentArticleTitle, commentAuthorName: $commentAuthorName, commentAuthorThumbnailURL: $commentAuthorThumbnailURL, commentArticleType: $commentArticleType, commentArticlePerfect: $commentArticlePerfect, commentContent: $commentContent, commentSharpURL: $commentSharpURL, hasRead: $hasRead, commentCreateTime: $commentCreateTime}';
  }
}

/// 提到我通知
class NoticeAt {
  /// 通知 id
  String oId;

  /// 数据类型
  int dataType;

  /// 用户名
  String userName;

  /// 用户头像
  String userAvatarURL;

  /// 通知内容
  String content;

  /// 是否已读
  bool hasRead;

  /// 创建时间
  String createTime;

  NoticeAt({
    this.oId = '',
    this.dataType = 0,
    this.userName = '',
    this.userAvatarURL = '',
    this.content = '',
    this.hasRead = false,
    this.createTime = '',
  });

  NoticeAt.from(Map<String, dynamic> data)
      : oId = data['oId'] ?? '',
        dataType = data['dataType'] ?? 0,
        userName = data['userName'] ?? '',
        userAvatarURL = data['userAvatarURL'] ?? '',
        content = data['content'] ?? '',
        hasRead = data['hasRead'] ?? false,
        createTime = data['createTime'] ?? '';

  Map<String, dynamic> toJson() => {
        'oId': oId,
        'dataType': dataType,
        'userName': userName,
        'userAvatarURL': userAvatarURL,
        'content': content,
        'hasRead': hasRead,
        'createTime': createTime,
      };

  @override
  String toString() {
    return 'NoticeAt{oId: $oId, dataType: $dataType, userName: $userName, userAvatarURL: $userAvatarURL, content: $content, hasRead: $hasRead, createTime: $createTime}';
  }
}

class NoticeFollow {
  /// 通知 Id
  String oId;

  /// 文章地址
  String url;

  /// 数据类型
  int dataType;

  /// 文章标题
  String articleTitle;

  /// 作者
  String authorName;

  /// 通知内容
  String content;

  /// 是否评论
  bool isComment;

  /// 作者头像
  String thumbnailURL;

  /// 文章评论数
  int articleCommentCount;

  /// 是否精选
  int articlePerfect;

  /// 文章标签列表
  List<ArticleTag> articleTagObjs;

  /// 文章标签
  String articleTags;

  /// 文章类型
  int articleType;

  /// 是否已读
  bool hasRead;

  /// 通知创建时间
  String createTime;

  NoticeFollow({
    this.oId = '',
    this.url = '',
    this.dataType = 0,
    this.articleTitle = '',
    this.authorName = '',
    this.content = '',
    this.isComment = false,
    this.thumbnailURL = '',
    this.articleCommentCount = 0,
    this.articlePerfect = 0,
    this.articleTagObjs = const [],
    this.articleTags = '',
    this.articleType = 0,
    this.hasRead = false,
    this.createTime = '',
  });

  NoticeFollow.from(Map<String, dynamic> data)
      : oId = data['oId'] ?? '',
        url = data['url'] ?? '',
        dataType = data['dataType'] ?? 0,
        articleTitle = data['articleTitle'] ?? '',
        authorName = data['authorName'] ?? '',
        content = data['content'] ?? '',
        isComment = data['isComment'] ?? false,
        thumbnailURL = data['thumbnailURL'] ?? '',
        articleCommentCount = data['articleCommentCount'] ?? 0,
        articlePerfect = data['articlePerfect'] ?? 0,
        articleTagObjs = (data['articleTagObjs'] as List)
                .map((i) => ArticleTag.from(i))
                .toList() ??
            [],
        articleTags = data['articleTags'] ?? '',
        articleType = data['articleType'] ?? 0,
        hasRead = data['hasRead'] ?? false,
        createTime = data['createTime'] ?? '';

  Map<String, dynamic> toJson() => {
        'oId': oId,
        'url': url,
        'dataType': dataType,
        'articleTitle': articleTitle,
        'authorName': authorName,
        'content': content,
        'isComment': isComment,
        'thumbnailURL': thumbnailURL,
        'articleCommentCount': articleCommentCount,
        'articlePerfect': articlePerfect,
        'articleTagObjs': articleTagObjs.map((i) => i.toJson()).toList(),
        'articleTags': articleTags,
        'articleType': articleType,
        'hasRead': hasRead,
        'createTime': createTime,
      };

  @override
  String toString() =>
      'NoticeFollow{oId: $oId, url: $url, dataType: $dataType, articleTitle: $articleTitle, authorName: $authorName, content: $content, isComment: $isComment, thumbnailURL: $thumbnailURL, articleCommentCount: $articleCommentCount, articlePerfect: $articlePerfect, articleTagObjs: $articleTagObjs, articleTags: $articleTags, articleType: $articleType, hasRead: $hasRead, createTime: $createTime}';
}

/// 系统通知数据
class NoticeSystem {
  /// 消息的 oId
  String oId;

  /// 用户 Id
  String userId;

  /// 数据 Id
  String dataId;

  /// 数据类型
  int dataType;

  /// 消息描述
  String description;

  /// 是否已读
  bool hasRead;

  /// 创建日期
  String createTime;

  NoticeSystem({
    this.oId = '',
    this.userId = '',
    this.dataId = '',
    this.dataType = 0,
    this.description = '',
    this.hasRead = false,
    this.createTime = '',
  });

  NoticeSystem.from(Map<String, dynamic> data)
      : oId = data['oId'] ?? '',
        userId = data['userId'] ?? '',
        dataId = data['dataId'] ?? '',
        dataType = data['dataType'] ?? 0,
        description = data['description'] ?? '',
        hasRead = data['hasRead'] ?? false,
        createTime = data['createTime'] ?? '';

  Map<String, dynamic> toJson() => {
        'oId': oId,
        'userId': userId,
        'dataId': dataId,
        'dataType': dataType,
        'description': description,
        'hasRead': hasRead,
        'createTime': createTime,
      };

  @override
  String toString() {
    return 'NoticeSystem{oId: $oId, userId: $userId, dataId: $dataId, dataType: $dataType, description: $description, hasRead: $hasRead, createTime: $createTime}';
  }
}

/// NoticePoint | NoticeComment | NoticeAt | NoticeFollow | NoticeSystem 列表，根据 NoticeType 变化
typedef NoticeList = List<dynamic>;
