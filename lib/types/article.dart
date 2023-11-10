import 'package:fishpi/src/utils.dart';

import 'fishpi.dart';

/// 发帖信息
// ignore_for_file: constant_identifier_names

class ArticlePost {
  /// 帖子标题
  String articleTitle;

  /// 帖子内容
  String articleContent;

  /// 帖子标签
  String articleTags;

  /// 是否允许评论
  bool articleCommentable;

  /// 是否帖子关注者
  bool articleNotifyFollowers;

  /// 帖子类型
  int articleType;

  /// 是否在列表展示
  int articleShowInList;

  /// 打赏内容
  String? articleRewardContent;

  /// 打赏积分
  String? articleRewardPoint;

  /// 是否匿名
  bool? articleAnonymous;

  /// 提问悬赏积分
  int? articleQnAOfferPoint;

  ArticlePost({
    this.articleTitle = '',
    this.articleContent = '',
    this.articleTags = '',
    this.articleCommentable = false,
    this.articleNotifyFollowers = false,
    this.articleType = 0,
    this.articleShowInList = 0,
    this.articleRewardContent,
    this.articleRewardPoint,
    this.articleAnonymous,
    this.articleQnAOfferPoint,
  });

  ArticlePost.from(Map<String, dynamic> data)
      : articleTitle = data['articleTitle'] ?? '',
        articleContent = data['articleContent'] ?? '',
        articleTags = data['articleTags'] ?? '',
        articleCommentable = data['articleCommentable'] ?? false,
        articleNotifyFollowers = data['articleNotifyFollowers'] ?? false,
        articleType = data['articleType'] ?? 0,
        articleShowInList = data['articleShowInList'] ?? 0,
        articleRewardContent = data['articleRewardContent'],
        articleRewardPoint = data['articleRewardPoint'],
        articleAnonymous = data['articleAnonymous'],
        articleQnAOfferPoint = data['articleQnAOfferPoint'];

  Map<String, dynamic> toJson() => {
        'articleTitle': articleTitle,
        'articleContent': articleContent,
        'articleTags': articleTags,
        'articleCommentable': articleCommentable,
        'articleNotifyFollowers': articleNotifyFollowers,
        'articleType': articleType,
        'articleShowInList': articleShowInList,
        'articleRewardContent': articleRewardContent,
        'articleRewardPoint': articleRewardPoint,
        'articleAnonymous': articleAnonymous,
        'articleQnAOfferPoint': articleQnAOfferPoint,
      };

  @override
  String toString() {
    return 'ArticlePost{articleTitle: $articleTitle, articleContent: $articleContent, articleTags: $articleTags, articleCommentable: $articleCommentable, articleNotifyFollowers: $articleNotifyFollowers, articleType: $articleType, articleShowInList: $articleShowInList, articleRewardContent: $articleRewardContent, articleRewardPoint: $articleRewardPoint, articleAnonymous: $articleAnonymous, articleQnAOfferPoint: $articleQnAOfferPoint}';
  }
}

/// 文章标签
class ArticleTag {
  /// 标签 id
  String oId;

  /// 标签名
  String tagTitle;

  /// 标签描述
  String tagDescription;

  /// icon 地址
  String tagIconPath;

  /// 标签地址
  String tagURI;

  /// 标签自定义 CSS
  String tagCSS;

  /// 反对数
  int tagBadCnt;

  /// 标签回帖计数
  int tagCommentCount;

  /// 关注数
  int tagFollowerCount;

  /// 点赞数
  int tagGoodCnt;

  /// 引用计数
  int tagReferenceCount;

  /// 标签相关链接计数
  int tagLinkCount;

  /// 标签 SEO 描述
  String tagSeoDesc;

  /// 标签关键字
  String tagSeoKeywords;

  /// 标签 SEO 标题
  String tagSeoTitle;

  /// 标签广告内容
  String tagAd;

  /// 是否展示广告
  int tagShowSideAd;

  /// 标签状态
  int tagStatus;

  /// 标签随机数
  double tagRandomDouble;

  ArticleTag({
    this.oId = '',
    this.tagTitle = '',
    this.tagDescription = '',
    this.tagIconPath = '',
    this.tagURI = '',
    this.tagCSS = '',
    this.tagBadCnt = 0,
    this.tagCommentCount = 0,
    this.tagFollowerCount = 0,
    this.tagGoodCnt = 0,
    this.tagReferenceCount = 0,
    this.tagLinkCount = 0,
    this.tagSeoDesc = '',
    this.tagSeoKeywords = '',
    this.tagSeoTitle = '',
    this.tagAd = '',
    this.tagShowSideAd = 0,
    this.tagStatus = 0,
    this.tagRandomDouble = 0.0,
  });

  ArticleTag.from(Map<String, dynamic> data)
      : oId = data['oId'] ?? '',
        tagTitle = data['tagTitle'] ?? '',
        tagDescription = data['tagDescription'] ?? '',
        tagIconPath = data['tagIconPath'] ?? '',
        tagURI = data['tagURI'] ?? '',
        tagCSS = data['tagCSS'] ?? '',
        tagBadCnt = data['tagBadCnt'] ?? 0,
        tagCommentCount = data['tagCommentCount'] ?? 0,
        tagFollowerCount = data['tagFollowerCount'] ?? 0,
        tagGoodCnt = data['tagGoodCnt'] ?? 0,
        tagReferenceCount = data['tagReferenceCount'] ?? 0,
        tagLinkCount = data['tagLinkCount'] ?? 0,
        tagSeoDesc = data['tagSeoDesc'] ?? '',
        tagSeoKeywords = data['tagSeoKeywords'] ?? '',
        tagSeoTitle = data['tagSeoTitle'] ?? '',
        tagAd = data['tagAd'] ?? '',
        tagShowSideAd = data['tagShowSideAd'] ?? 0,
        tagStatus = data['tagStatus'] ?? 0,
        tagRandomDouble = data['tagRandomDouble'] ?? 0.0;

  Map<String, dynamic> toJson() => {
        'oId': oId,
        'tagTitle': tagTitle,
        'tagDescription': tagDescription,
        'tagIconPath': tagIconPath,
        'tagURI': tagURI,
        'tagCSS': tagCSS,
        'tagBadCnt': tagBadCnt,
        'tagCommentCount': tagCommentCount,
        'tagFollowerCount': tagFollowerCount,
        'tagGoodCnt': tagGoodCnt,
        'tagReferenceCount': tagReferenceCount,
        'tagLinkCount': tagLinkCount,
        'tagSeoDesc': tagSeoDesc,
        'tagSeoKeywords': tagSeoKeywords,
        'tagSeoTitle': tagSeoTitle,
        'tagAd': tagAd,
        'tagShowSideAd': tagShowSideAd,
        'tagStatus': tagStatus,
        'tagRandomDouble': tagRandomDouble,
      };

  @override
  String toString() =>
      'ArticleTag{oId: $oId, tagTitle: $tagTitle, tagDescription: $tagDescription, tagIconPath: $tagIconPath, tagURI: $tagURI, tagCSS: $tagCSS, tagBadCnt: $tagBadCnt, tagCommentCount: $tagCommentCount, tagFollowerCount: $tagFollowerCount, tagGoodCnt: $tagGoodCnt, tagReferenceCount: $tagReferenceCount, tagLinkCount: $tagLinkCount, tagSeoDesc: $tagSeoDesc, tagSeoKeywords: $tagSeoKeywords, tagSeoTitle: $tagSeoTitle, tagAd: $tagAd, tagShowSideAd: $tagShowSideAd, tagStatus: $tagStatus, tagRandomDouble: $tagRandomDouble}';
}

/// 公开状态
enum PublicStatus {
  /// 公开
  Public,

  /// 私有
  Private,
}

/// 投票状态，点赞与否
enum VoteStatus {
  /// 未投票
  normal,

  /// 点赞
  up,

  /// 点踩
  down,
}

/// 点赞类型
class VoteType {
  static const int Voted = 0; // 点赞
  static const int Unvote = -1; // 取消点赞
}

/// 是否状态
enum YesNoStatus {
  yes,
  no,
}

/// 文章状态
enum ArticleStatus {
  /// 正常
  Normal,

  /// 封禁
  Ban,

  /// 锁定
  Lock,
}

class ArticleAuthor {
  /// 用户是否在线
  bool userOnlineFlag;

  /// 用户在线时长
  int onlineMinute;

  /// 是否公开积分列表
  PublicStatus userPointStatus;

  /// 是否公开关注者列表
  PublicStatus userFollowerStatus;

  /// 用户完成新手指引步数
  int userGuideStep;

  /// 是否公开在线状态
  PublicStatus userOnlineStatus;

  /// 上次登录日期
  int userCurrentCheckinStreakStart;

  /// 是否聊天室图片自动模糊
  bool chatRoomPictureStatus;

  /// 用户标签
  String userTags;

  /// 是否公开回帖列表
  PublicStatus userCommentStatus;

  /// 用户时区
  String userTimezone;

  /// 用户个人主页
  String userURL;

  /// 是否启用站外链接跳转页面
  bool userForwardPageStatus;

  /// 是否公开 UA 信息
  PublicStatus userUAStatus;

  /// 自定义首页跳转地址
  String userIndexRedirectURL;

  /// 最近发帖时间
  int userLatestArticleTime;

  /// 标签计数
  int userTagCount;

  /// 昵称
  String userNickname;

  /// 回帖浏览模式
  int userListViewMode;

  /// 最长连续签到
  int userLongestCheckinStreak;

  /// 用户头像类型
  int userAvatarType;

  /// 用户确认邮件发送时间
  int userSubMailSendTime;

  /// 用户最后更新时间
  int userUpdateTime;

  /// userSubMailStatus
  YesNoStatus userSubMailStatus;

  /// 是否加入积分排行
  YesNoStatus userJoinPointRank;

  /// 用户最后登录时间
  int userLatestLoginTime;

  /// 应用角色
  int userAppRole;

  /// 头像查看模式
  int userAvatarViewMode;

  /// 用户状态
  int userStatus;

  /// 用户上次最长连续签到日期
  int userLongestCheckinStreakEnd;

  /// 是否公开关注帖子列表
  PublicStatus userWatchingArticleStatus;

  /// 上次回帖时间
  int userLatestCmtTime;

  /// 用户省份
  String userProvince;

  /// 用户当前连续签到计数
  int userCurrentCheckinStreak;

  /// 用户编号
  int userNo;

  /// 用户头像
  String userAvatarURL;

  /// 是否公开关注标签列表
  PublicStatus userFollowingTagStatus;

  /// 用户语言
  String userLanguage;

  /// 是否加入消费排行
  YesNoStatus userJoinUsedPointRank;

  /// 上次签到日期
  int userCurrentCheckinStreakEnd;

  /// 是否公开收藏帖子列表
  PublicStatus userFollowingArticleStatus;

  /// 是否启用键盘快捷键
  YesNoStatus userKeyboardShortcutsStatus;

  /// 是否回帖后自动关注帖子
  YesNoStatus userReplyWatchArticleStatus;

  /// 回帖浏览模式
  int userCommentViewMode;

  /// 是否公开清风明月列表
  PublicStatus userBreezemoonStatus;

  /// 用户上次签到时间
  int userCheckinTime;

  /// 用户消费积分
  int userUsedPoint;

  /// 是否公开发帖列表
  PublicStatus userArticleStatus;

  /// 用户积分
  int userPoint;

  /// 用户回帖数
  int userCommentCount;

  /// 用户个性签名
  String userIntro;

  /// 移动端主题
  String userMobileSkin;

  /// 分页每页条目
  int userListPageSize;

  /// 文章 Id
  String oId;

  /// 用户名
  String userName;

  /// 是否公开 IP 地理信息
  PublicStatus userGeoStatus;

  /// 最长连续签到起始日
  int userLongestCheckinStreakStart;

  /// 用户主题
  String userSkin;

  /// 是否启用 Web 通知
  YesNoStatus userNotifyStatus;

  /// 公开关注用户列表
  PublicStatus userFollowingUserStatus;

  /// 文章数
  int userArticleCount;

  /// 用户角色
  String userRole;

  /// 徽章
  MetalList sysMetal;

  String get name => userNickname.isEmpty ? userName : userNickname;

  String get allName =>
      userNickname.isEmpty ? userName : '$userNickname($userName)';


  ArticleAuthor({
    this.userOnlineFlag = false,
    this.onlineMinute = 0,
    this.userPointStatus = PublicStatus.Public,
    this.userFollowerStatus = PublicStatus.Public,
    this.userGuideStep = 0,
    this.userOnlineStatus = PublicStatus.Public,
    this.userCurrentCheckinStreakStart = 0,
    this.chatRoomPictureStatus = false,
    this.userTags = '',
    this.userCommentStatus = PublicStatus.Public,
    this.userTimezone = '',
    this.userURL = '',
    this.userForwardPageStatus = false,
    this.userUAStatus = PublicStatus.Public,
    this.userIndexRedirectURL = '',
    this.userLatestArticleTime = 0,
    this.userTagCount = 0,
    this.userNickname = '',
    this.userListViewMode = 0,
    this.userLongestCheckinStreak = 0,
    this.userAvatarType = 0,
    this.userSubMailSendTime = 0,
    this.userUpdateTime = 0,
    this.userSubMailStatus = YesNoStatus.yes,
    this.userJoinPointRank = YesNoStatus.yes,
    this.userLatestLoginTime = 0,
    this.userAppRole = 0,
    this.userAvatarViewMode = 0,
    this.userStatus = 0,
    this.userLongestCheckinStreakEnd = 0,
    this.userWatchingArticleStatus = PublicStatus.Public,
    this.userLatestCmtTime = 0,
    this.userProvince = '',
    this.userCurrentCheckinStreak = 0,
    this.userNo = 0,
    this.userAvatarURL = '',
    this.userFollowingTagStatus = PublicStatus.Public,
    this.userLanguage = '',
    this.userJoinUsedPointRank = YesNoStatus.yes,
    this.userCurrentCheckinStreakEnd = 0,
    this.userFollowingArticleStatus = PublicStatus.Public,
    this.userKeyboardShortcutsStatus = YesNoStatus.yes,
    this.userReplyWatchArticleStatus = YesNoStatus.yes,
    this.userCommentViewMode = 0,
    this.userBreezemoonStatus = PublicStatus.Public,
    this.userCheckinTime = 0,
    this.userUsedPoint = 0,
    this.userArticleStatus = PublicStatus.Public,
    this.userPoint = 0,
    this.userCommentCount = 0,
    this.userIntro = '',
    this.userMobileSkin = '',
    this.userListPageSize = 0,
    this.oId = '',
    this.userName = '',
    this.userGeoStatus = PublicStatus.Public,
    this.userLongestCheckinStreakStart = 0,
    this.userSkin = '',
    this.userNotifyStatus = YesNoStatus.yes,
    this.userFollowingUserStatus = PublicStatus.Public,
    this.userArticleCount = 0,
    this.userRole = '',
    this.sysMetal = const [],
  });

  ArticleAuthor.from(Map<String, dynamic> data)
      : userOnlineFlag = data['userOnlineFlag'] ?? false,
        onlineMinute = data['onlineMinute'] ?? 0,
        userPointStatus = PublicStatus.values[data['userPointStatus'] ?? 0],
        userFollowerStatus =
            PublicStatus.values[data['userFollowerStatus'] ?? 0],
        userGuideStep = data['userGuideStep'] ?? 0,
        userOnlineStatus = PublicStatus.values[data['userOnlineStatus'] ?? 0],
        userCurrentCheckinStreakStart =
            data['userCurrentCheckinStreakStart'] ?? 0,
        chatRoomPictureStatus = data['chatRoomPictureStatus'] ?? false,
        userTags = data['userTags'] ?? '',
        userCommentStatus = PublicStatus.values[data['userCommentStatus'] ?? 0],
        userTimezone = data['userTimezone'] ?? '',
        userURL = data['userURL'] ?? '',
        userForwardPageStatus = data['userForwardPageStatus'] ?? false,
        userUAStatus = PublicStatus.values[data['userUAStatus'] ?? 0],
        userIndexRedirectURL = data['userIndexRedirectURL'] ?? '',
        userLatestArticleTime = data['userLatestArticleTime'] ?? 0,
        userTagCount = data['userTagCount'] ?? 0,
        userNickname = data['userNickname'] ?? '',
        userListViewMode = data['userListViewMode'] ?? 0,
        userLongestCheckinStreak = data['userLongestCheckinStreak'] ?? 0,
        userAvatarType = data['userAvatarType'] ?? 0,
        userSubMailSendTime = data['userSubMailSendTime'] ?? 0,
        userUpdateTime = data['userUpdateTime'] ?? 0,
        userSubMailStatus = YesNoStatus.values[data['userSubMailStatus'] ?? 0],
        userJoinPointRank = YesNoStatus.values[data['userJoinPointRank'] ?? 0],
        userLatestLoginTime = data['userLatestLoginTime'] ?? 0,
        userAppRole = data['userAppRole'] ?? 0,
        userAvatarViewMode = data['userAvatarViewMode'] ?? 0,
        userStatus = data['userStatus'] ?? 0,
        userLongestCheckinStreakEnd = data['userLongestCheckinStreakEnd'] ?? 0,
        userWatchingArticleStatus =
            PublicStatus.values[data['userWatchingArticleStatus'] ?? 0],
        userLatestCmtTime = data['userLatestCmtTime'] ?? 0,
        userProvince = data['userProvince'] ?? '',
        userCurrentCheckinStreak = data['userCurrentCheckinStreak'] ?? 0,
        userNo = data['userNo'] ?? 0,
        userAvatarURL = data['userAvatarURL'] ?? '',
        userFollowingTagStatus =
            PublicStatus.values[data['userFollowingTagStatus'] ?? 0],
        userLanguage = data['userLanguage'] ?? '',
        userJoinUsedPointRank =
            YesNoStatus.values[data['userJoinUsedPointRank'] ?? 0],
        userCurrentCheckinStreakEnd = data['userCurrentCheckinStreakEnd'] ?? 0,
        userFollowingArticleStatus =
            PublicStatus.values[data['userFollowingArticleStatus'] ?? 0],
        userKeyboardShortcutsStatus =
            YesNoStatus.values[data['userKeyboardShortcutsStatus'] ?? 0],
        userReplyWatchArticleStatus =
            YesNoStatus.values[data['userReplyWatchArticleStatus'] ?? 0],
        userCommentViewMode = data['userCommentViewMode'] ?? 0,
        userBreezemoonStatus =
            PublicStatus.values[data['userBreezemoonStatus'] ?? 0],
        userCheckinTime = data['userCheckinTime'] ?? 0,
        userUsedPoint = data['userUsedPoint'] ?? 0,
        userArticleStatus = PublicStatus.values[data['userArticleStatus'] ?? 0],
        userPoint = data['userPoint'] ?? 0,
        userCommentCount = data['userCommentCount'] ?? 0,
        userIntro = data['userIntro'] ?? '',
        userMobileSkin = data['userMobileSkin'] ?? '',
        userListPageSize = data['userListPageSize'] ?? 0,
        oId = data['oId'] ?? '',
        userName = data['userName'] ?? '',
        userGeoStatus = PublicStatus.values[data['userGeoStatus'] ?? 0],
        userLongestCheckinStreakStart =
            data['userLongestCheckinStreakStart'] ?? 0,
        userSkin = data['userSkin'] ?? '',
        userNotifyStatus = YesNoStatus.values[data['userNotifyStatus'] ?? 0],
        userFollowingUserStatus =
            PublicStatus.values[data['userFollowingUserStatus'] ?? 0],
        userArticleCount = data['userArticleCount'] ?? 0,
        userRole = data['userRole'] ?? '',
        sysMetal = toMetal(data['sysMetal']);

  Map<String, dynamic> toJson() => {
        'userOnlineFlag': userOnlineFlag,
        'onlineMinute': onlineMinute,
        'userPointStatus': userPointStatus.index,
        'userFollowerStatus': userFollowerStatus.index,
        'userGuideStep': userGuideStep,
        'userOnlineStatus': userOnlineStatus.index,
        'userCurrentCheckinStreakStart': userCurrentCheckinStreakStart,
        'chatRoomPictureStatus': chatRoomPictureStatus,
        'userTags': userTags,
        'userCommentStatus': userCommentStatus.index,
        'userTimezone': userTimezone,
        'userURL': userURL,
        'userForwardPageStatus': userForwardPageStatus,
        'userUAStatus': userUAStatus.index,
        'userIndexRedirectURL': userIndexRedirectURL,
        'userLatestArticleTime': userLatestArticleTime,
        'userTagCount': userTagCount,
        'userNickname': userNickname,
        'userListViewMode': userListViewMode,
        'userLongestCheckinStreak': userLongestCheckinStreak,
        'userAvatarType': userAvatarType,
        'userSubMailSendTime': userSubMailSendTime,
        'userUpdateTime': userUpdateTime,
        'userSubMailStatus': userSubMailStatus.index,
        'userJoinPointRank': userJoinPointRank.index,
        'userLatestLoginTime': userLatestLoginTime,
        'userAppRole': userAppRole,
        'userAvatarViewMode': userAvatarViewMode,
        'userStatus': userStatus,
        'userLongestCheckinStreakEnd': userLongestCheckinStreakEnd,
        'userWatchingArticleStatus': userWatchingArticleStatus.index,
        'userLatestCmtTime': userLatestCmtTime,
        'userProvince': userProvince,
        'userCurrentCheckinStreak': userCurrentCheckinStreak,
        'userNo': userNo,
        'userAvatarURL': userAvatarURL,
        'userFollowingTagStatus': userFollowingTagStatus.index,
        'userLanguage': userLanguage,
        'userJoinUsedPointRank': userJoinUsedPointRank.index,
        'userCurrentCheckinStreakEnd': userCurrentCheckinStreakEnd,
        'userFollowingArticleStatus': userFollowingArticleStatus.index,
        'userKeyboardShortcutsStatus': userKeyboardShortcutsStatus.index,
        'userReplyWatchArticleStatus': userReplyWatchArticleStatus.index,
        'userCommentViewMode': userCommentViewMode,
        'userBreezemoonStatus': userBreezemoonStatus.index,
        'userCheckinTime': userCheckinTime,
        'userUsedPoint': userUsedPoint,
        'userArticleStatus': userArticleStatus.index,
        'userPoint': userPoint,
        'userCommentCount': userCommentCount,
        'userIntro': userIntro,
        'userMobileSkin': userMobileSkin,
        'userListPageSize': userListPageSize,
        'oId': oId,
        'userName': userName,
        'userGeoStatus': userGeoStatus.index,
        'userLongestCheckinStreakStart': userLongestCheckinStreakStart,
        'userSkin': userSkin,
        'userNotifyStatus': userNotifyStatus.index,
        'userFollowingUserStatus': userFollowingUserStatus.index,
        'userArticleCount': userArticleCount,
        'userRole': userRole,
        'sysMetal': sysMetal.map((e) => e.toJson()).toList(),
      };
}

typedef CommentAuthor = ArticleAuthor;

/// 文章评论
class ArticleComment {
  /// 是否优评
  bool commentNice;

  /// 评论创建时间字符串
  String commentCreateTimeStr;

  /// 评论作者 id
  String commentAuthorId;

  /// 评论分数
  int commentScore;

  /// 评论创建时间
  String commentCreateTime;

  /// 评论作者头像
  String commentAuthorURL;

  /// 评论状态
  VoteStatus commentVote;

  /// 评论引用数
  int commentRevisionCount;

  /// 评论经过时间
  String timeAgo;

  /// 回复评论 id
  String commentOriginalCommentId;

  /// 徽章
  List<Metal> sysMetal;

  /// 点赞数
  int commentGoodCnt;

  /// 评论是否可见
  YesNoStatus commentVisible;

  /// 文章 id
  String commentOnArticleId;

  /// 评论感谢数
  int rewardedCnt;

  /// 评论地址
  String commentSharpURL;

  /// 是否匿名
  bool commentAnonymous;

  /// 评论回复数
  int commentReplyCnt;

  /// 评论 id
  String oId;

  /// 评论内容
  String commentContent;

  /// 评论状态
  ArticleStatus commentStatus;

  /// 评论作者
  CommentAuthor commenter = CommentAuthor();

  /// 评论作者用户名
  String commentAuthorName;

  /// 评论感谢数
  int commentThankCnt;

  /// 评论点踩数
  int commentBadCnt;

  /// 是否已感谢
  bool rewarded;

  /// 评论作者头像
  String commentAuthorThumbnailURL;

  /// 评论音频地址
  String commentAudioURL;

  /// 评论是否采纳，1 表示采纳
  int commentQnAOffered;

  ArticleComment(
      {this.commentNice = false,
      this.commentCreateTimeStr = '',
      this.commentAuthorId = '',
      this.commentScore = 0,
      this.commentCreateTime = '',
      this.commentAuthorURL = '',
      this.commentVote = VoteStatus.normal,
      this.commentRevisionCount = 0,
      this.timeAgo = '',
      this.commentOriginalCommentId = '',
      this.sysMetal = const [],
      this.commentGoodCnt = 0,
      this.commentVisible = YesNoStatus.yes,
      this.commentOnArticleId = '',
      this.rewardedCnt = 0,
      this.commentSharpURL = '',
      this.commentAnonymous = false,
      this.commentReplyCnt = 0,
      this.oId = '',
      this.commentContent = '',
      this.commentStatus = ArticleStatus.Normal,
      this.commentAuthorName = '',
      this.commentThankCnt = 0,
      this.commentBadCnt = 0,
      this.rewarded = false,
      this.commentAuthorThumbnailURL = '',
      this.commentAudioURL = '',
      this.commentQnAOffered = 0,
      commenter}) {
    this.commenter = commenter ?? CommentAuthor();
  }

  ArticleComment.from(Map<String, dynamic> data)
      : commentNice = data['commentNice'] ?? false,
        commentCreateTimeStr = data['commentCreateTimeStr'] ?? '',
        commentAuthorId = data['commentAuthorId'] ?? '',
        commentScore = data['commentScore'] ?? 0,
        commentCreateTime = data['commentCreateTime'] ?? '',
        commentAuthorURL = data['commentAuthorURL'] ?? '',
        commentVote = VoteStatus.values[data['commentVote'] ?? 0],
        commentRevisionCount = data['commentRevisionCount'] ?? 0,
        timeAgo = data['timeAgo'] ?? '',
        commentOriginalCommentId = data['commentOriginalCommentId'] ?? '',
        sysMetal = toMetal(data['sysMetal']),
        commentGoodCnt = data['commentGoodCnt'] ?? 0,
        commentVisible = YesNoStatus.values[data['commentVisible'] ?? 0],
        commentOnArticleId = data['commentOnArticleId'] ?? '',
        rewardedCnt = data['rewardedCnt'] ?? 0,
        commentSharpURL = data['commentSharpURL'] ?? '',
        commentAnonymous = data['commentAnonymous'] ?? false,
        commentReplyCnt = data['commentReplyCnt'] ?? 0,
        oId = data['oId'] ?? '',
        commentContent = data['commentContent'] ?? '',
        commentStatus = ArticleStatus.values[data['commentStatus'] ?? 0],
        commentAuthorName = data['commentAuthorName'] ?? '',
        commentThankCnt = data['commentThankCnt'] ?? 0,
        commentBadCnt = data['commentBadCnt'] ?? 0,
        rewarded = data['rewarded'] ?? false,
        commentAuthorThumbnailURL = data['commentAuthorThumbnailURL'] ?? '',
        commentAudioURL = data['commentAudioURL'] ?? '',
        commentQnAOffered = data['commentQnAOffered'] ?? 0,
        commenter = CommentAuthor.from(data['commenter'] ?? {});

  Map<String, dynamic> toJson() => {
        'commentNice': commentNice,
        'commentCreateTimeStr': commentCreateTimeStr,
        'commentAuthorId': commentAuthorId,
        'commentScore': commentScore,
        'commentCreateTime': commentCreateTime,
        'commentAuthorURL': commentAuthorURL,
        'commentVote': commentVote.index,
        'commentRevisionCount': commentRevisionCount,
        'timeAgo': timeAgo,
        'commentOriginalCommentId': commentOriginalCommentId,
        'sysMetal': sysMetal.map((e) => e.toJson()).toList(),
        'commentGoodCnt': commentGoodCnt,
        'commentVisible': commentVisible.index,
        'commentOnArticleId': commentOnArticleId,
        'rewardedCnt': rewardedCnt,
        'commentSharpURL': commentSharpURL,
        'commentAnonymous': commentAnonymous,
        'commentReplyCnt': commentReplyCnt,
        'oId': oId,
        'commentContent': commentContent,
        'commentStatus': commentStatus.index,
        'commentAuthorName': commentAuthorName,
        'commentThankCnt': commentThankCnt,
        'commentBadCnt': commentBadCnt,
        'rewarded': rewarded,
        'commentAuthorThumbnailURL': commentAuthorThumbnailURL,
        'commentAudioURL': commentAudioURL,
        'commentQnAOffered': commentQnAOffered,
        'commenter': commenter.toJson(),
      };
}

class Pagination {
  /// 总分页数
  String paginationPageCount;

  /// 建议分页页码
  List<int> paginationPageNums;

  Pagination({
    this.paginationPageCount = '',
    this.paginationPageNums = const [],
  });

  Pagination.from(Map<String, dynamic> data)
      : paginationPageCount = data['paginationPageCount'] ?? '',
        paginationPageNums = data['paginationPageNums'] ?? const [];

  Map<String, dynamic> toJson() => {
        'paginationPageCount': paginationPageCount,
        'paginationPageNums': paginationPageNums,
      };
}

/// 帖子类型
enum ArticleType {
  Normal,
  Private,
  Broadcast,
  Thought,
  Unknown,
  Question,
}

/// 文章详情
class ArticleDetail {
  /// 是否在列表展示
  bool articleShowInList;

  /// 文章创建时间
  String articleCreateTime;

  /// 发布者Id
  String articleAuthorId;

  /// 反对数
  int articleBadCnt;

  /// 文章最后修改时间
  String articleLatestCmtTime;

  /// 赞同数
  int articleGoodCnt;

  /// 悬赏积分
  int articleQnAOfferPoint;

  /// 作者头像缩略图
  String articleThumbnailURL;

  /// 置顶序号
  int articleStickRemains;

  /// 发布时间简写
  String timeAgo;

  /// 文章更新时间
  String articleUpdateTimeStr;

  /// 作者用户名
  String articleAuthorName;

  /// 文章类型
  ArticleType articleType;

  /// 是否悬赏
  bool offered;

  /// 文章创建时间字符串
  String articleCreateTimeStr;

  /// 文章浏览数
  int articleViewCount;

  /// 作者头像缩略图
  String articleAuthorThumbnailURL20;

  /// 关注数
  int articleWatchCnt;

  /// 文章预览内容
  String articlePreviewContent;

  /// 文章标题
  String articleTitleEmoj;

  /// 文章标题（Unicode 的 Emoji）
  String articleTitleEmojUnicode;

  /// 文章标题
  String articleTitle;

  /// 作者头像缩略图
  String articleAuthorThumbnailURL48;

  /// 文章评论数
  int articleCommentCount;

  /// 收藏数
  int articleCollectCnt;

  /// 文章最后评论者
  String articleLatestCmterName;

  /// 文章标签
  String articleTags;

  /// 文章 id
  String oId;

  /// 最后评论时间简写
  String cmtTimeAgo;

  /// 是否置顶
  int articleStick;

  /// 文章标签信息
  List<ArticleTag> articleTagObjs;

  /// 文章最后评论时间
  String articleLatestCmtTimeStr;

  /// 是否匿名
  bool articleAnonymous;

  /// 文章感谢数
  int articleThankCnt;

  /// 文章更新时间
  String articleUpdateTime;

  /// 文章状态
  ArticleStatus articleStatus;

  /// 文章点击数
  int articleHeat;

  /// 文章是否优选
  bool articlePerfect;

  /// 作者头像缩略图
  String articleAuthorThumbnailURL210;

  /// 文章固定链接
  String articlePermalink;

  /// 作者用户信息
  ArticleAuthor articleAuthor = ArticleAuthor();

  /// 文章感谢数
  int thankedCnt;

  /// 文章匿名浏览量
  int articleAnonymousView;

  /// 文章浏览量简写
  String articleViewCntDisplayFormat;

  /// 文章是否启用评论
  bool articleCommentable;

  /// 是否已打赏
  bool rewarded;

  /// 打赏人数
  int rewardedCnt;

  /// 文章打赏积分
  int articleRewardPoint;

  /// 是否已收藏
  bool isFollowing;

  /// 是否已关注
  bool isWatching;

  /// 是否是我的文章
  bool isMyArticle;

  /// 是否已感谢
  bool thanked;

  /// 编辑器类型
  int articleEditorType;

  /// 文章音频地址
  String articleAudioURL;

  /// 文章目录 HTML
  String articleToC;

  /// 文章内容 HTML
  String articleContent;

  /// 文章内容 Markdown
  String articleOriginalContent;

  /// 文章缩略图
  String articleImg1URL;

  /// 文章点赞状态
  VoteStatus articleVote;

  /// 文章随机数
  double articleRandomDouble;

  /// 作者签名
  String articleAuthorIntro;

  /// 发布城市
  String articleCity;

  /// 发布者 IP
  String articleIP;

  /// 作者首页地址
  String articleAuthorURL;

  /// 推送 Email 推送顺序
  int articlePushOrder;

  /// 打赏内容
  String articleRewardContent;

  /// reddit分数
  String redditScore;

  /// 评论分页信息
  Pagination? pagination;

  /// 评论是否可见
  bool discussionViewable;

  /// 文章修改次数
  int articleRevisionCount;

  /// 文章的评论
  List<ArticleComment> articleComments;

  /// 文章最佳评论
  List<ArticleComment> articleNiceComments;

  ArticleDetail({
    this.articleShowInList = false,
    this.articleCreateTime = '',
    this.articleAuthorId = '',
    this.articleBadCnt = 0,
    this.articleLatestCmtTime = '',
    this.articleGoodCnt = 0,
    this.articleQnAOfferPoint = 0,
    this.articleThumbnailURL = '',
    this.articleStickRemains = 0,
    this.timeAgo = '',
    this.articleUpdateTimeStr = '',
    this.articleAuthorName = '',
    this.articleType = ArticleType.Normal,
    this.offered = false,
    this.articleCreateTimeStr = '',
    this.articleViewCount = 0,
    this.articleAuthorThumbnailURL20 = '',
    this.articleWatchCnt = 0,
    this.articlePreviewContent = '',
    this.articleTitleEmoj = '',
    this.articleTitleEmojUnicode = '',
    this.articleTitle = '',
    this.articleAuthorThumbnailURL48 = '',
    this.articleCommentCount = 0,
    this.articleCollectCnt = 0,
    this.articleLatestCmterName = '',
    this.articleTags = '',
    this.oId = '',
    this.cmtTimeAgo = '',
    this.articleStick = 0,
    this.articleTagObjs = const [],
    this.articleLatestCmtTimeStr = '',
    this.articleAnonymous = false,
    this.articleThankCnt = 0,
    this.articleUpdateTime = '',
    this.articleStatus = ArticleStatus.Normal,
    this.articleHeat = 0,
    this.articlePerfect = false,
    this.articleAuthorThumbnailURL210 = '',
    this.articlePermalink = '',
    articleAuthor,
    this.thankedCnt = 0,
    this.articleAnonymousView = 0,
    this.articleViewCntDisplayFormat = '',
    this.articleCommentable = false,
    this.rewarded = false,
    this.rewardedCnt = 0,
    this.articleRewardPoint = 0,
    this.isFollowing = false,
    this.isWatching = false,
    this.isMyArticle = false,
    this.thanked = false,
    this.articleEditorType = 0,
    this.articleAudioURL = '',
    this.articleToC = '',
    this.articleContent = '',
    this.articleOriginalContent = '',
    this.articleImg1URL = '',
    this.articleVote = VoteStatus.normal,
    this.articleRandomDouble = 0.0,
    this.articleAuthorIntro = '',
    this.articleCity = '',
    this.articleIP = '',
    this.articleAuthorURL = '',
    this.articlePushOrder = 0,
    this.articleRewardContent = '',
    this.redditScore = '',
    this.pagination,
    this.discussionViewable = false,
    this.articleRevisionCount = 0,
    this.articleComments = const [],
    this.articleNiceComments = const [],
  }) {
    this.articleAuthor = articleAuthor ?? ArticleAuthor();
  }

  ArticleDetail.from(Map<String, dynamic> data)
      : articleShowInList = data['articleShowInList'] ?? false,
        articleCreateTime = data['articleCreateTime'] ?? '',
        articleAuthorId = data['articleAuthorId'] ?? '',
        articleBadCnt = data['articleBadCnt'] ?? 0,
        articleLatestCmtTime = data['articleLatestCmtTime'] ?? '',
        articleGoodCnt = data['articleGoodCnt'] ?? 0,
        articleQnAOfferPoint = data['articleQnAOfferPoint'] ?? 0,
        articleThumbnailURL = data['articleThumbnailURL'] ?? '',
        articleStickRemains = data['articleStickRemains'] ?? 0,
        timeAgo = data['timeAgo'] ?? '',
        articleUpdateTimeStr = data['articleUpdateTimeStr'] ?? '',
        articleAuthorName = data['articleAuthorName'] ?? '',
        articleType = ArticleType.values[data['articleType'] ?? 0],
        offered = data['offered'] ?? false,
        articleCreateTimeStr = data['articleCreateTimeStr'] ?? '',
        articleViewCount = data['articleViewCount'] ?? 0,
        articleAuthorThumbnailURL20 = data['articleAuthorThumbnailURL20'] ?? '',
        articleWatchCnt = data['articleWatchCnt'] ?? 0,
        articlePreviewContent = data['articlePreviewContent'] ?? '',
        articleTitleEmoj = data['articleTitleEmoj'] ?? '',
        articleTitleEmojUnicode = data['articleTitleEmojUnicode'] ?? '',
        articleTitle = data['articleTitle'] ?? '',
        articleAuthorThumbnailURL48 = data['articleAuthorThumbnailURL48'] ?? '',
        articleCommentCount = data['articleCommentCount'] ?? 0,
        articleCollectCnt = data['articleCollectCnt'] ?? 0,
        articleLatestCmterName = data['articleLatestCmterName'] ?? '',
        articleTags = data['articleTags'] ?? '',
        oId = data['oId'] ?? '',
        cmtTimeAgo = data['cmtTimeAgo'] ?? '',
        articleStick = data['articleStick'] ?? 0,
        articleTagObjs = data['articleTagObjs'] ?? const [],
        articleLatestCmtTimeStr = data['articleLatestCmtTimeStr'] ?? '',
        articleAnonymous = data['articleAnonymous'] ?? false,
        articleThankCnt = data['articleThankCnt'] ?? 0,
        articleUpdateTime = data['articleUpdateTime'] ?? '',
        articleStatus = ArticleStatus.values[data['articleStatus'] ?? 0],
        articleHeat = data['articleHeat'] ?? 0,
        articlePerfect = data['articlePerfect'] ?? false,
        articleAuthorThumbnailURL210 =
            data['articleAuthorThumbnailURL210'] ?? '',
        articlePermalink = data['articlePermalink'] ?? '',
        articleAuthor = ArticleAuthor.from(data['articleAuthor'] ?? {}),
        thankedCnt = data['thankedCnt'] ?? 0,
        articleAnonymousView = data['articleAnonymousView'] ?? 0,
        articleViewCntDisplayFormat = data['articleViewCntDisplayFormat'] ?? '',
        articleCommentable = data['articleCommentable'] ?? false,
        rewarded = data['rewarded'] ?? false,
        rewardedCnt = data['rewardedCnt'] ?? 0,
        articleRewardPoint = data['articleRewardPoint'] ?? 0,
        isFollowing = data['isFollowing'] ?? false,
        isWatching = data['isWatching'] ?? false,
        isMyArticle = data['isMyArticle'] ?? false,
        thanked = data['thanked'] ?? false,
        articleEditorType = data['articleEditorType'] ?? 0,
        articleAudioURL = data['articleAudioURL'] ?? '',
        articleToC = data['articleToC'] ?? '',
        articleContent = data['articleContent'] ?? '',
        articleOriginalContent = data['articleOriginalContent'] ?? '',
        articleImg1URL = data['articleImg1URL'] ?? '',
        articleVote = VoteStatus.values[data['articleVote'] ?? 0],
        articleRandomDouble = data['articleRandomDouble'] ?? 0.0,
        articleAuthorIntro = data['articleAuthorIntro'] ?? '',
        articleCity = data['articleCity'] ?? '',
        articleIP = data['articleIP'] ?? '',
        articleAuthorURL = data['articleAuthorURL'] ?? '',
        articlePushOrder = data['articlePushOrder'] ?? 0,
        articleRewardContent = data['articleRewardContent'] ?? '',
        redditScore = data['redditScore'] ?? '',
        pagination = data['pagination'] != null
            ? Pagination.from(data['pagination'])
            : null,
        discussionViewable = data['discussionViewable'] ?? false,
        articleRevisionCount = data['articleRevisionCount'] ?? 0,
        articleComments = List.from(data['articleComments'] ?? [])
            .map((e) => ArticleComment.from(e))
            .toList(),
        articleNiceComments = List.from(data['articleNiceComments'] ?? [])
            .map((e) => ArticleComment.from(e))
            .toList();

  Map<String, dynamic> toJson() => {
        'articleShowInList': articleShowInList,
        'articleCreateTime': articleCreateTime,
        'articleAuthorId': articleAuthorId,
        'articleBadCnt': articleBadCnt,
        'articleLatestCmtTime': articleLatestCmtTime,
        'articleGoodCnt': articleGoodCnt,
        'articleQnAOfferPoint': articleQnAOfferPoint,
        'articleThumbnailURL': articleThumbnailURL,
        'articleStickRemains': articleStickRemains,
        'timeAgo': timeAgo,
        'articleUpdateTimeStr': articleUpdateTimeStr,
        'articleAuthorName': articleAuthorName,
        'articleType': articleType.index,
        'offered': offered,
        'articleCreateTimeStr': articleCreateTimeStr,
        'articleViewCount': articleViewCount,
        'articleAuthorThumbnailURL20': articleAuthorThumbnailURL20,
        'articleWatchCnt': articleWatchCnt,
        'articlePreviewContent': articlePreviewContent,
        'articleTitleEmoj': articleTitleEmoj,
        'articleTitleEmojUnicode': articleTitleEmojUnicode,
        'articleTitle': articleTitle,
        'articleAuthorThumbnailURL48': articleAuthorThumbnailURL48,
        'articleCommentCount': articleCommentCount,
        'articleCollectCnt': articleCollectCnt,
        'articleLatestCmterName': articleLatestCmterName,
        'articleTags': articleTags,
        'oId': oId,
        'cmtTimeAgo': cmtTimeAgo,
        'articleStick': articleStick,
        'articleTagObjs': articleTagObjs.map((e) => e.toJson()).toList(),
        'articleLatestCmtTimeStr': articleLatestCmtTimeStr,
        'articleAnonymous': articleAnonymous,
        'articleThankCnt': articleThankCnt,
        'articleUpdateTime': articleUpdateTime,
        'articleStatus': articleStatus.index,
        'articleHeat': articleHeat,
        'articlePerfect': articlePerfect,
        'articleAuthorThumbnailURL210': articleAuthorThumbnailURL210,
        'articlePermalink': articlePermalink,
        'articleAuthor': articleAuthor.toJson(),
        'thankedCnt': thankedCnt,
        'articleAnonymousView': articleAnonymousView,
        'articleViewCntDisplayFormat': articleViewCntDisplayFormat,
        'articleCommentable': articleCommentable,
        'rewarded': rewarded,
        'rewardedCnt': rewardedCnt,
        'articleRewardPoint': articleRewardPoint,
        'isFollowing': isFollowing,
        'isWatching': isWatching,
        'isMyArticle': isMyArticle,
        'thanked': thanked,
        'articleEditorType': articleEditorType,
        'articleAudioURL': articleAudioURL,
        'articleToC': articleToC,
        'articleContent': articleContent,
        'articleOriginalContent': articleOriginalContent,
        'articleImg1URL': articleImg1URL,
        'articleVote': articleVote.index,
        'articleRandomDouble': articleRandomDouble,
        'articleAuthorIntro': articleAuthorIntro,
        'articleCity': articleCity,
        'articleIP': articleIP,
        'articleAuthorURL': articleAuthorURL,
        'articlePushOrder': articlePushOrder,
        'articleRewardContent': articleRewardContent,
        'redditScore': redditScore,
        'pagination': pagination?.toJson(),
        'discussionViewable': discussionViewable,
        'articleRevisionCount': articleRevisionCount,
        'articleComments': articleComments.map((e) => e.toJson()).toList(),
        'articleNiceComments':
            articleNiceComments.map((e) => e.toJson()).toList(),
      };
}

/// 文章列表
class ArticleList {
  List<ArticleDetail> articles = []; // 文章列表
  Pagination pagination = Pagination(); // 分页信息
  ArticleTag? tag; // 标签信息，仅查询标签下文章列表有效

  ArticleList({articles, pagination, tag}) {
    this.articles = articles ?? [];
    this.pagination = pagination ?? Pagination();
    this.tag = tag ?? ArticleTag();
  }

  // 从 JSON 数据构造对象
  ArticleList.from(Map<String, dynamic> data) {
    if (data['articles'] != null) {
      articles = [];
      data['articles'].forEach((v) {
        articles.add(ArticleDetail.from(v));
      });
    }
    pagination = data['pagination'] != null
        ? Pagination.from(data['pagination'])
        : Pagination();
    tag = data['tag'] != null ? ArticleTag.from(data['tag']) : null;
  }

  // 将对象转换为 JSON 数据
  Map<String, dynamic> toJson() => {
        'articles': articles.map((e) => e.toJson()).toList(),
        'pagination': pagination.toJson(),
        'tag': tag?.toJson(),
      };
}

/// 帖子列表查询类型
class ArticleListType {
  /// 最近
  static const String Recent = 'recent';
  /// 热门
  static const String Hot = 'hot';
  /// 点赞
  static const String Good = 'good';
  /// 最近回复
  static const String Reply = 'reply';
  /// 优选，需包含标签
  static const String Perfect = 'perfect';

  static String toCode(String type) {
    switch (type) {
      case Recent:
        return '';
      case Hot:
        return '/hot';
      case Good:
        return '/good';
      case Reply:
        return '/reply';
      case Perfect:
        return '/perfect';
      default:
        return '';
    }
  }

  static List<String> get values => [Recent, Hot, Good, Reply, Perfect];
}

/// 评论发布
class CommentPost {
  String articleId; // 文章 Id
  bool commentAnonymous; // 是否匿名评论
  bool commentVisible; // 评论是否楼主可见
  String commentContent; // 评论内容
  String commentOriginalCommentId; // 回复评论 Id

  CommentPost({
    this.articleId = '',
    this.commentAnonymous = false,
    this.commentVisible = false,
    this.commentContent = '',
    this.commentOriginalCommentId = '',
  });

  // 从 JSON 数据构造对象
  CommentPost.from(Map<String, dynamic> json)
      : articleId = json['articleId'],
        commentAnonymous = json['commentAnonymous'],
        commentVisible = json['commentVisible'],
        commentContent = json['commentContent'],
        commentOriginalCommentId = json['commentOriginalCommentId'];

  // 将对象转换为 JSON 数据
  Map<String, dynamic> toJson() => {
        'articleId': articleId,
        'commentAnonymous': commentAnonymous,
        'commentVisible': commentVisible,
        'commentContent': commentContent,
        'commentOriginalCommentId': commentOriginalCommentId,
      };
}
