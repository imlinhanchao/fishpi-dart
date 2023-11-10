class BreezemoonContent {
  /// 发布者用户名
  String breezemoonAuthorName;

  /// 最后更新时间
  String breezemoonUpdated;

  /// 清风明月ID
  String oId;

  /// 创建时间
  String breezemoonCreated;

  /// 发布者头像URL
  String breezemoonAuthorThumbnailURL48;

  /// 发布时间
  String timeAgo;

  /// 正文
  String breezemoonContent;

  /// 创建时间
  String breezemoonCreateTime;

  /// 发布城市（可能为空，请注意做判断）
  String breezemoonCity;

  BreezemoonContent({
    this.breezemoonAuthorName = '',
    this.breezemoonUpdated = '',
    this.oId = '',
    this.breezemoonCreated = '',
    this.breezemoonAuthorThumbnailURL48 = '',
    this.timeAgo = '',
    this.breezemoonContent = '',
    this.breezemoonCreateTime = '',
    this.breezemoonCity = '',
  });

  BreezemoonContent.from(Map<String, dynamic> data)
      : breezemoonAuthorName = data['breezemoonAuthorName'] ?? '',
        breezemoonUpdated = data['breezemoonUpdated']?.toString() ?? '',
        oId = data['oId'],
        breezemoonCreated = data['breezemoonCreated']?.toString() ?? '',
        breezemoonAuthorThumbnailURL48 = data['breezemoonAuthorThumbnailURL48'] ?? '',
        timeAgo = data['timeAgo'] ?? '',
        breezemoonContent = data['breezemoonContent'] ?? '',
        breezemoonCreateTime = data['breezemoonCreateTime'] ?? '',
        breezemoonCity = data['breezemoonCity'] ?? '';

  Map<String, dynamic> toJson() => {
        'breezemoonAuthorName': breezemoonAuthorName,
        'breezemoonUpdated': breezemoonUpdated,
        'oId': oId,
        'breezemoonCreated': breezemoonCreated,
        'breezemoonAuthorThumbnailURL48': breezemoonAuthorThumbnailURL48,
        'timeAgo': timeAgo,
        'breezemoonContent': breezemoonContent,
        'breezemoonCreateTime': breezemoonCreateTime,
        'breezemoonCity': breezemoonCity,
      };

  @override
  String toString() {
    return 'BreezemoonContent{breezemoonAuthorName: $breezemoonAuthorName, breezemoonUpdated: $breezemoonUpdated, oId: $oId, breezemoonCreated: $breezemoonCreated, breezemoonAuthorThumbnailURL48: $breezemoonAuthorThumbnailURL48, timeAgo: $timeAgo, breezemoonContent: $breezemoonContent, breezemoonCreateTime: $breezemoonCreateTime, breezemoonCity: $breezemoonCity}';
  }
}
