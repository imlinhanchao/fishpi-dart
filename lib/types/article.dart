import 'package:fishpi/src/utils.dart';

import 'fishpi.dart';

/// 发帖信息
// ignore_for_file: constant_identifier_names

class ArticlePost {
  /// 帖子标题
  String title;

  /// 帖子内容
  String content;

  /// 帖子标签
  String tags;

  /// 是否允许评论
  bool commentable;

  /// 是否帖子关注者
  bool notifyFollowers;

  /// 帖子类型，ArticleType
  int type;

  /// 是否在列表展示
  int showInList;

  /// 打赏内容
  String? rewardContent;

  /// 打赏积分
  String? rewardPoint;

  /// 是否匿名
  bool? anonymous;

  /// 提问悬赏积分
  int? offerPoint;

  ArticlePost({
    this.title = '',
    this.content = '',
    this.tags = '',
    this.commentable = false,
    this.notifyFollowers = false,
    this.type = 0,
    this.showInList = 0,
    this.rewardContent,
    this.rewardPoint,
    this.anonymous,
    this.offerPoint,
  });

  ArticlePost.from(Map<String, dynamic> data)
      : title = data['articleTitle'] ?? '',
        content = data['articleContent'] ?? '',
        tags = data['articleTags'] ?? '',
        commentable = data['articleCommentable'] ?? false,
        notifyFollowers = data['articleNotifyFollowers'] ?? false,
        type = data['articleType'] ?? 0,
        showInList = data['articleShowInList'] ?? 0,
        rewardContent = data['articleRewardContent'],
        rewardPoint = data['articleRewardPoint'],
        anonymous = data['articleAnonymous'],
        offerPoint = data['articleQnAOfferPoint'];

  Map<String, dynamic> toJson() => {
        'articleTitle': title,
        'articleContent': content,
        'articleTags': tags,
        'articleCommentable': commentable,
        'articleNotifyFollowers': notifyFollowers,
        'articleType': type,
        'articleShowInList': showInList,
        'articleRewardContent': rewardContent,
        'articleRewardPoint': rewardPoint,
        'articleAnonymous': anonymous,
        'articleQnAOfferPoint': offerPoint,
      };

  @override
  String toString() {
    return 'ArticlePost{articleTitle: $title, articleContent: $content, articleTags: $tags, articleCommentable: $commentable, articleNotifyFollowers: $notifyFollowers, articleType: $type, articleShowInList: $showInList, articleRewardContent: $rewardContent, articleRewardPoint: $rewardPoint, articleAnonymous: $anonymous, articleQnAOfferPoint: $offerPoint}';
  }
}

/// 文章标签
class ArticleTag {
  /// 标签 id
  String oId;

  /// 标签名
  String title;

  /// 标签描述
  String description;

  /// icon 地址
  String iconPath;

  /// 标签地址
  String uri;

  /// 标签自定义 CSS
  String diyCSS;

  /// 反对数
  int badCnt;

  /// 标签回帖计数
  int commentCount;

  /// 关注数
  int followerCount;

  /// 点赞数
  int goodCnt;

  /// 引用计数
  int referenceCount;

  /// 标签相关链接计数
  int linkCount;

  /// 标签 SEO 描述
  String seoDesc;

  /// 标签关键字
  String seoKeywords;

  /// 标签 SEO 标题
  String seoTitle;

  /// 标签广告内容
  String tagAd;

  /// 是否展示广告
  int showSideAd;

  /// 标签状态
  int status;

  /// 标签随机数
  double randomDouble;

  ArticleTag({
    this.oId = '',
    this.title = '',
    this.description = '',
    this.iconPath = '',
    this.uri = '',
    this.diyCSS = '',
    this.badCnt = 0,
    this.commentCount = 0,
    this.followerCount = 0,
    this.goodCnt = 0,
    this.referenceCount = 0,
    this.linkCount = 0,
    this.seoDesc = '',
    this.seoKeywords = '',
    this.seoTitle = '',
    this.tagAd = '',
    this.showSideAd = 0,
    this.status = 0,
    this.randomDouble = 0.0,
  });

  ArticleTag.from(Map<String, dynamic> data)
      : oId = data['oId'] ?? '',
        title = data['tagTitle'] ?? '',
        description = data['tagDescription'] ?? '',
        iconPath = data['tagIconPath'] ?? '',
        uri = data['tagURI'] ?? '',
        diyCSS = data['tagCSS'] ?? '',
        badCnt = data['tagBadCnt'] ?? 0,
        commentCount = data['tagCommentCount'] ?? 0,
        followerCount = data['tagFollowerCount'] ?? 0,
        goodCnt = data['tagGoodCnt'] ?? 0,
        referenceCount = data['tagReferenceCount'] ?? 0,
        linkCount = data['tagLinkCount'] ?? 0,
        seoDesc = data['tagSeoDesc'] ?? '',
        seoKeywords = data['tagSeoKeywords'] ?? '',
        seoTitle = data['tagSeoTitle'] ?? '',
        tagAd = data['tagAd'] ?? '',
        showSideAd = data['tagShowSideAd'] ?? 0,
        status = data['tagStatus'] ?? 0,
        randomDouble = data['tagRandomDouble'] ?? 0.0;

  Map<String, dynamic> toJson() => {
        'oId': oId,
        'tagTitle': title,
        'tagDescription': description,
        'tagIconPath': iconPath,
        'tagURI': uri,
        'tagCSS': diyCSS,
        'tagBadCnt': badCnt,
        'tagCommentCount': commentCount,
        'tagFollowerCount': followerCount,
        'tagGoodCnt': goodCnt,
        'tagReferenceCount': referenceCount,
        'tagLinkCount': linkCount,
        'tagSeoDesc': seoDesc,
        'tagSeoKeywords': seoKeywords,
        'tagSeoTitle': seoTitle,
        'tagAd': tagAd,
        'tagShowSideAd': showSideAd,
        'tagStatus': status,
        'tagRandomDouble': randomDouble,
      };

  @override
  String toString() =>
      'ArticleTag{oId: $oId, tagTitle: $title, tagDescription: $description, tagIconPath: $iconPath, tagURI: $uri, tagCSS: $diyCSS, tagBadCnt: $badCnt, tagCommentCount: $commentCount, tagFollowerCount: $followerCount, tagGoodCnt: $goodCnt, tagReferenceCount: $referenceCount, tagLinkCount: $linkCount, tagSeoDesc: $seoDesc, tagSeoKeywords: $seoKeywords, tagSeoTitle: $seoTitle, tagAd: $tagAd, tagShowSideAd: $showSideAd, tagStatus: $status, tagRandomDouble: $randomDouble}';
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
  bool isOnline;

  /// 用户在线时长
  int onlineMinute;

  /// 是否公开积分列表
  PublicStatus pointStatus;

  /// 是否公开关注者列表
  PublicStatus followerStatus;

  /// 用户完成新手指引步数
  int guideStep;

  /// 是否公开在线状态
  PublicStatus onlineStatus;

  /// 当前连续签到起始日
  int currentCheckinStreakStart;

  /// 是否聊天室图片自动模糊
  bool isAutoBlur;

  /// 用户标签
  String tags;

  /// 是否公开回帖列表
  PublicStatus commentStatus;

  /// 用户时区
  String timezone;

  /// 用户个人主页
  String homePage;

  /// 是否启用站外链接跳转页面
  bool isEnableForwardPage;

  /// 是否公开 UA 信息
  PublicStatus userUAStatus;

  /// 自定义首页跳转地址
  String userIndexRedirectURL;

  /// 最近发帖时间
  int latestArticleTime;

  /// 标签计数
  int tagCount;

  /// 昵称
  String userNickname;

  /// 回帖浏览模式
  int listViewMode;

  /// 最长连续签到
  int longestCheckinStreak;

  /// 用户头像类型
  int avatarType;

  /// 用户确认邮件发送时间
  int subMailSendTime;

  /// 用户最后更新时间
  int updateTime;

  /// userSubMailStatus
  YesNoStatus subMailStatus;

  /// 是否加入积分排行
  YesNoStatus isJoinPointRank;

  /// 用户最后登录时间
  int latestLoginTime;

  /// 应用角色
  int userAppRole;

  /// 头像查看模式
  int userAvatarViewMode;

  /// 用户状态
  int userStatus;

  /// 用户上次最长连续签到日期
  int longestCheckinStreakEnd;

  /// 是否公开关注帖子列表
  PublicStatus watchingArticleStatus;

  /// 上次回帖时间
  int latestCmtTime;

  /// 用户省份
  String province;

  /// 用户当前连续签到计数
  int currentCheckinStreak;

  /// 用户编号
  int userNo;

  /// 用户头像
  String userAvatarURL;

  /// 是否公开关注标签列表
  PublicStatus followingTagStatus;

  /// 用户语言
  String userLanguage;

  /// 是否加入消费排行
  YesNoStatus isJoinUsedPointRank;

  /// 上次签到日期
  int currentCheckinStreakEnd;

  /// 是否公开收藏帖子列表
  PublicStatus followingArticleStatus;

  /// 是否启用键盘快捷键
  YesNoStatus keyboardShortcutsStatus;

  /// 是否回帖后自动关注帖子
  YesNoStatus replyWatchArticleStatus;

  /// 回帖浏览模式
  int commentViewMode;

  /// 是否公开清风明月列表
  PublicStatus breezemoonStatus;

  /// 用户上次签到时间
  int userCheckinTime;

  /// 用户消费积分
  int userUsedPoint;

  /// 是否公开发帖列表
  PublicStatus articleStatus;

  /// 用户积分
  int userPoint;

  /// 用户回帖数
  int commentCount;

  /// 用户个性签名
  String userIntro;

  /// 移动端主题
  String userMobileSkin;

  /// 分页每页条目
  int listPageSize;

  /// 文章 Id
  String oId;

  /// 用户名
  String userName;

  /// 是否公开 IP 地理信息
  PublicStatus geoStatus;

  /// 最长连续签到起始日
  int longestCheckinStreakStart;

  /// 用户主题
  String userSkin;

  /// 是否启用 Web 通知
  YesNoStatus notifyStatus;

  /// 公开关注用户列表
  PublicStatus followingUserStatus;

  /// 文章数
  int articleCount;

  /// 用户角色
  String userRole;

  /// 徽章
  MetalList sysMetal;

  String get name => userNickname.isEmpty ? userName : userNickname;

  String get allName =>
      userNickname.isEmpty ? userName : '$userNickname($userName)';

  ArticleAuthor({
    this.isOnline = false,
    this.onlineMinute = 0,
    this.pointStatus = PublicStatus.Public,
    this.followerStatus = PublicStatus.Public,
    this.guideStep = 0,
    this.onlineStatus = PublicStatus.Public,
    this.currentCheckinStreakStart = 0,
    this.isAutoBlur = false,
    this.tags = '',
    this.commentStatus = PublicStatus.Public,
    this.timezone = '',
    this.homePage = '',
    this.isEnableForwardPage = false,
    this.userUAStatus = PublicStatus.Public,
    this.userIndexRedirectURL = '',
    this.latestArticleTime = 0,
    this.tagCount = 0,
    this.userNickname = '',
    this.listViewMode = 0,
    this.longestCheckinStreak = 0,
    this.avatarType = 0,
    this.subMailSendTime = 0,
    this.updateTime = 0,
    this.subMailStatus = YesNoStatus.yes,
    this.isJoinPointRank = YesNoStatus.yes,
    this.latestLoginTime = 0,
    this.userAppRole = 0,
    this.userAvatarViewMode = 0,
    this.userStatus = 0,
    this.longestCheckinStreakEnd = 0,
    this.watchingArticleStatus = PublicStatus.Public,
    this.latestCmtTime = 0,
    this.province = '',
    this.currentCheckinStreak = 0,
    this.userNo = 0,
    this.userAvatarURL = '',
    this.followingTagStatus = PublicStatus.Public,
    this.userLanguage = '',
    this.isJoinUsedPointRank = YesNoStatus.yes,
    this.currentCheckinStreakEnd = 0,
    this.followingArticleStatus = PublicStatus.Public,
    this.keyboardShortcutsStatus = YesNoStatus.yes,
    this.replyWatchArticleStatus = YesNoStatus.yes,
    this.commentViewMode = 0,
    this.breezemoonStatus = PublicStatus.Public,
    this.userCheckinTime = 0,
    this.userUsedPoint = 0,
    this.articleStatus = PublicStatus.Public,
    this.userPoint = 0,
    this.commentCount = 0,
    this.userIntro = '',
    this.userMobileSkin = '',
    this.listPageSize = 0,
    this.oId = '',
    this.userName = '',
    this.geoStatus = PublicStatus.Public,
    this.longestCheckinStreakStart = 0,
    this.userSkin = '',
    this.notifyStatus = YesNoStatus.yes,
    this.followingUserStatus = PublicStatus.Public,
    this.articleCount = 0,
    this.userRole = '',
    this.sysMetal = const [],
  });

  ArticleAuthor.from(Map<String, dynamic> data)
      : isOnline = data['userOnlineFlag'] ?? false,
        onlineMinute = data['onlineMinute'] ?? 0,
        pointStatus = PublicStatus.values[data['userPointStatus'] ?? 0],
        followerStatus = PublicStatus.values[data['userFollowerStatus'] ?? 0],
        guideStep = data['userGuideStep'] ?? 0,
        onlineStatus = PublicStatus.values[data['userOnlineStatus'] ?? 0],
        currentCheckinStreakStart = data['userCurrentCheckinStreakStart'] ?? 0,
        isAutoBlur = (data['chatRoomPictureStatus'] ?? 0) == 1,
        tags = data['userTags'] ?? '',
        commentStatus = PublicStatus.values[data['userCommentStatus'] ?? 0],
        timezone = data['userTimezone'] ?? '',
        homePage = data['userURL'] ?? '',
        isEnableForwardPage = (data['userForwardPageStatus'] ?? 0) == 1,
        userUAStatus = PublicStatus.values[data['userUAStatus'] ?? 0],
        userIndexRedirectURL = data['userIndexRedirectURL'] ?? '',
        latestArticleTime = data['userLatestArticleTime'] ?? 0,
        tagCount = data['userTagCount'] ?? 0,
        userNickname = data['userNickname'] ?? '',
        listViewMode = data['userListViewMode'] ?? 0,
        longestCheckinStreak = data['userLongestCheckinStreak'] ?? 0,
        avatarType = data['userAvatarType'] ?? 0,
        subMailSendTime = data['userSubMailSendTime'] ?? 0,
        updateTime = data['userUpdateTime'] ?? 0,
        subMailStatus = YesNoStatus.values[data['userSubMailStatus'] ?? 0],
        isJoinPointRank = YesNoStatus.values[data['userJoinPointRank'] ?? 0],
        latestLoginTime = data['userLatestLoginTime'] ?? 0,
        userAppRole = data['userAppRole'] ?? 0,
        userAvatarViewMode = data['userAvatarViewMode'] ?? 0,
        userStatus = data['userStatus'] ?? 0,
        longestCheckinStreakEnd = data['userLongestCheckinStreakEnd'] ?? 0,
        watchingArticleStatus =
            PublicStatus.values[data['userWatchingArticleStatus'] ?? 0],
        latestCmtTime = data['userLatestCmtTime'] ?? 0,
        province = data['userProvince'] ?? '',
        currentCheckinStreak = data['userCurrentCheckinStreak'] ?? 0,
        userNo = data['userNo'] ?? 0,
        userAvatarURL = data['userAvatarURL'] ?? '',
        followingTagStatus =
            PublicStatus.values[data['userFollowingTagStatus'] ?? 0],
        userLanguage = data['userLanguage'] ?? '',
        isJoinUsedPointRank =
            YesNoStatus.values[data['userJoinUsedPointRank'] ?? 0],
        currentCheckinStreakEnd = data['userCurrentCheckinStreakEnd'] ?? 0,
        followingArticleStatus =
            PublicStatus.values[data['userFollowingArticleStatus'] ?? 0],
        keyboardShortcutsStatus =
            YesNoStatus.values[data['userKeyboardShortcutsStatus'] ?? 0],
        replyWatchArticleStatus =
            YesNoStatus.values[data['userReplyWatchArticleStatus'] ?? 0],
        commentViewMode = data['userCommentViewMode'] ?? 0,
        breezemoonStatus =
            PublicStatus.values[data['userBreezemoonStatus'] ?? 0],
        userCheckinTime = data['userCheckinTime'] ?? 0,
        userUsedPoint = data['userUsedPoint'] ?? 0,
        articleStatus = PublicStatus.values[data['userArticleStatus'] ?? 0],
        userPoint = data['userPoint'] ?? 0,
        commentCount = data['userCommentCount'] ?? 0,
        userIntro = data['userIntro'] ?? '',
        userMobileSkin = data['userMobileSkin'] ?? '',
        listPageSize = data['userListPageSize'] ?? 0,
        oId = data['oId'] ?? '',
        userName = data['userName'] ?? '',
        geoStatus = PublicStatus.values[data['userGeoStatus'] ?? 0],
        longestCheckinStreakStart = data['userLongestCheckinStreakStart'] ?? 0,
        userSkin = data['userSkin'] ?? '',
        notifyStatus = YesNoStatus.values[data['userNotifyStatus'] ?? 0],
        followingUserStatus =
            PublicStatus.values[data['userFollowingUserStatus'] ?? 0],
        articleCount = data['userArticleCount'] ?? 0,
        userRole = data['userRole'] ?? '',
        sysMetal = List.from(data['sysMetal'] ?? [])
            .map((e) => analyzeMetalAttr(e))
            .toList();

  Map<String, dynamic> toJson() => {
        'userOnlineFlag': isOnline,
        'onlineMinute': onlineMinute,
        'userPointStatus': pointStatus.index,
        'userFollowerStatus': followerStatus.index,
        'userGuideStep': guideStep,
        'userOnlineStatus': onlineStatus.index,
        'userCurrentCheckinStreakStart': currentCheckinStreakStart,
        'chatRoomPictureStatus': isAutoBlur,
        'userTags': tags,
        'userCommentStatus': commentStatus.index,
        'userTimezone': timezone,
        'userURL': homePage,
        'userForwardPageStatus': isEnableForwardPage,
        'userUAStatus': userUAStatus.index,
        'userIndexRedirectURL': userIndexRedirectURL,
        'userLatestArticleTime': latestArticleTime,
        'userTagCount': tagCount,
        'userNickname': userNickname,
        'userListViewMode': listViewMode,
        'userLongestCheckinStreak': longestCheckinStreak,
        'userAvatarType': avatarType,
        'userSubMailSendTime': subMailSendTime,
        'userUpdateTime': updateTime,
        'userSubMailStatus': subMailStatus.index,
        'userJoinPointRank': isJoinPointRank.index,
        'userLatestLoginTime': latestLoginTime,
        'userAppRole': userAppRole,
        'userAvatarViewMode': userAvatarViewMode,
        'userStatus': userStatus,
        'userLongestCheckinStreakEnd': longestCheckinStreakEnd,
        'userWatchingArticleStatus': watchingArticleStatus.index,
        'userLatestCmtTime': latestCmtTime,
        'userProvince': province,
        'userCurrentCheckinStreak': currentCheckinStreak,
        'userNo': userNo,
        'userAvatarURL': userAvatarURL,
        'userFollowingTagStatus': followingTagStatus.index,
        'userLanguage': userLanguage,
        'userJoinUsedPointRank': isJoinUsedPointRank.index,
        'userCurrentCheckinStreakEnd': currentCheckinStreakEnd,
        'userFollowingArticleStatus': followingArticleStatus.index,
        'userKeyboardShortcutsStatus': keyboardShortcutsStatus.index,
        'userReplyWatchArticleStatus': replyWatchArticleStatus.index,
        'userCommentViewMode': commentViewMode,
        'userBreezemoonStatus': breezemoonStatus.index,
        'userCheckinTime': userCheckinTime,
        'userUsedPoint': userUsedPoint,
        'userArticleStatus': articleStatus.index,
        'userPoint': userPoint,
        'userCommentCount': commentCount,
        'userIntro': userIntro,
        'userMobileSkin': userMobileSkin,
        'userListPageSize': listPageSize,
        'oId': oId,
        'userName': userName,
        'userGeoStatus': geoStatus.index,
        'userLongestCheckinStreakStart': longestCheckinStreakStart,
        'userSkin': userSkin,
        'userNotifyStatus': notifyStatus.index,
        'userFollowingUserStatus': followingUserStatus.index,
        'userArticleCount': articleCount,
        'userRole': userRole,
        'sysMetal': sysMetal.map((e) => e.toJson()).toList(),
      };
}

typedef CommentAuthor = ArticleAuthor;

/// 文章评论
class ArticleComment {
  /// 是否优评
  bool isNice;

  /// 评论创建时间字符串
  String createTimeStr;

  /// 评论作者 id
  String commentAuthorId;

  /// 评论分数
  String score;

  /// 评论创建时间
  String createTime;

  /// 评论作者头像
  String authorURL;

  /// 评论状态
  VoteStatus vote;

  /// 评论引用数
  int revisionCount;

  /// 评论经过时间
  String timeAgo;

  /// 回复评论 id
  String originalCommentId;

  /// 徽章
  List<Metal> sysMetal;

  /// 点赞数
  int goodCnt;

  /// 评论是否可见
  YesNoStatus visible;

  /// 文章 id
  String articleId;

  /// 评论感谢数
  int rewardedCnt;

  /// 评论地址
  String sharpURL;

  /// 是否匿名
  bool isAnonymous;

  /// 评论回复数
  int replyCnt;

  /// 评论 id
  String oId;

  /// 评论内容
  String content;

  /// 评论状态
  ArticleStatus status;

  /// 评论作者
  CommentAuthor commenter = CommentAuthor();

  /// 评论作者用户名
  String authorName;

  /// 评论感谢数
  int thankCnt;

  /// 评论点踩数
  int badCnt;

  /// 是否已感谢
  bool rewarded;

  /// 评论作者头像
  String authorThumbnailURL;

  /// 评论音频地址
  String audioURL;

  /// 评论是否采纳，1 表示采纳
  int offered;

  ArticleComment(
      {this.isNice = false,
      this.createTimeStr = '',
      this.commentAuthorId = '',
      this.score = '',
      this.createTime = '',
      this.authorURL = '',
      this.vote = VoteStatus.normal,
      this.revisionCount = 0,
      this.timeAgo = '',
      this.originalCommentId = '',
      this.sysMetal = const [],
      this.goodCnt = 0,
      this.visible = YesNoStatus.yes,
      this.articleId = '',
      this.rewardedCnt = 0,
      this.sharpURL = '',
      this.isAnonymous = false,
      this.replyCnt = 0,
      this.oId = '',
      this.content = '',
      this.status = ArticleStatus.Normal,
      this.authorName = '',
      this.thankCnt = 0,
      this.badCnt = 0,
      this.rewarded = false,
      this.authorThumbnailURL = '',
      this.audioURL = '',
      this.offered = 0,
      commenter}) {
    this.commenter = commenter ?? CommentAuthor();
  }

  ArticleComment.from(Map<String, dynamic> data)
      : isNice = data['commentNice'] ?? false,
        createTimeStr = data['commentCreateTimeStr'] ?? '',
        commentAuthorId = data['commentAuthorId'] ?? '',
        score = (data['commentScore'] ?? 0).toString(),
        createTime = data['commentCreateTime'] ?? '',
        authorURL = data['commentAuthorURL'] ?? '',
        vote = VoteStatus.values[(data['commentVote'] ?? 0) + 1],
        revisionCount = data['commentRevisionCount'] ?? 0,
        timeAgo = data['timeAgo'] ?? '',
        originalCommentId = data['commentOriginalCommentId'] ?? '',
        sysMetal = List.from(data['sysMetal'])
            .map((e) => analyzeMetalAttr(e))
            .toList(),
        goodCnt = data['commentGoodCnt'] ?? 0,
        visible = YesNoStatus.values[data['commentVisible'] ?? 0],
        articleId = data['commentOnArticleId'] ?? '',
        rewardedCnt = data['rewardedCnt'] ?? 0,
        sharpURL = data['commentSharpURL'] ?? '',
        isAnonymous = (data['commentAnonymous'] ?? 0) == 1,
        replyCnt = data['commentReplyCnt'] ?? 0,
        oId = data['oId'] ?? '',
        content = data['commentContent'] ?? '',
        status = ArticleStatus.values[data['commentStatus'] ?? 0],
        authorName = data['commentAuthorName'] ?? '',
        thankCnt = data['commentThankCnt'] ?? 0,
        badCnt = data['commentBadCnt'] ?? 0,
        rewarded = data['rewarded'] ?? false,
        authorThumbnailURL = data['commentAuthorThumbnailURL'] ?? '',
        audioURL = data['commentAudioURL'] ?? '',
        offered = data['commentQnAOffered'] ?? 0,
        commenter = CommentAuthor.from(data['commenter'] ?? {});

  Map<String, dynamic> toJson() => {
        'commentNice': isNice,
        'commentCreateTimeStr': createTimeStr,
        'commentAuthorId': commentAuthorId,
        'commentScore': score,
        'commentCreateTime': createTime,
        'commentAuthorURL': authorURL,
        'commentVote': vote.index,
        'commentRevisionCount': revisionCount,
        'timeAgo': timeAgo,
        'commentOriginalCommentId': originalCommentId,
        'sysMetal': sysMetal.map((e) => e.toJson()).toList(),
        'commentGoodCnt': goodCnt,
        'commentVisible': visible.index,
        'commentOnArticleId': articleId,
        'rewardedCnt': rewardedCnt,
        'commentSharpURL': sharpURL,
        'commentAnonymous': isAnonymous,
        'commentReplyCnt': replyCnt,
        'oId': oId,
        'commentContent': content,
        'commentStatus': status.index,
        'commentAuthorName': authorName,
        'commentThankCnt': thankCnt,
        'commentBadCnt': badCnt,
        'rewarded': rewarded,
        'commentAuthorThumbnailURL': authorThumbnailURL,
        'commentAudioURL': audioURL,
        'commentQnAOffered': offered,
        'commenter': commenter.toJson(),
      };
}

class Pagination {
  /// 总分页数
  int count;

  /// 建议分页页码
  List<int> pageNums;

  Pagination({
    this.count = 0,
    this.pageNums = const [],
  });

  Pagination.from(Map<String, dynamic> data)
      : count = data['paginationPageCount'] ?? 0,
        pageNums = List.from(data['paginationPageNums'] ?? []);

  Map<String, dynamic> toJson() => {
        'paginationPageCount': count,
        'paginationPageNums': pageNums,
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
      : articleShowInList = (data['articleShowInList'] ?? 0) == 1,
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
        articleTagObjs = List.from(data['articleTagObjs'] ?? [])
            .map((e) => ArticleTag.from(e))
            .toList(),
        articleLatestCmtTimeStr = data['articleLatestCmtTimeStr'] ?? '',
        articleAnonymous = (data['articleAnonymous'] ?? 0) == 1,
        articleThankCnt = data['articleThankCnt'] ?? 0,
        articleUpdateTime = data['articleUpdateTime'] ?? '',
        articleStatus = ArticleStatus.values[data['articleStatus'] ?? 0],
        articleHeat = data['articleHeat'] ?? 0,
        articlePerfect = (data['articlePerfect'] ?? 0) == 1,
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
        articleVote = VoteStatus.values[(data['articleVote'] ?? 0) + 1],
        articleRandomDouble = data['articleRandomDouble'] ?? 0.0,
        articleAuthorIntro = data['articleAuthorIntro'] ?? '',
        articleCity = data['articleCity'] ?? '',
        articleIP = data['articleIP'] ?? '',
        articleAuthorURL = data['articleAuthorURL'] ?? '',
        articlePushOrder = data['articlePushOrder'] ?? 0,
        articleRewardContent = data['articleRewardContent'] ?? '',
        redditScore = (data['redditScore'] ?? 0).toString(),
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
  /// 文章 Id
  String articleId;

  /// 是否匿名评论
  bool isAnonymous;

  /// 评论是否楼主可见
  bool isVisible;

  /// 评论内容
  String content;

  /// 回复评论 Id
  String replyId;

  CommentPost({
    this.articleId = '',
    this.isAnonymous = false,
    this.isVisible = false,
    this.content = '',
    this.replyId = '',
  });

  // 从 JSON 数据构造对象
  CommentPost.from(Map<String, dynamic> json)
      : articleId = json['articleId'],
        isAnonymous = json['commentAnonymous'],
        isVisible = json['commentVisible'],
        content = json['commentContent'],
        replyId = json['commentOriginalCommentId'];

  // 将对象转换为 JSON 数据
  Map<String, dynamic> toJson() => {
        'articleId': articleId,
        'commentAnonymous': isAnonymous,
        'commentVisible': isVisible,
        'commentContent': content,
        'commentOriginalCommentId': replyId,
      };
}
