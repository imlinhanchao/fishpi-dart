import 'package:fishpi/fishpi.dart';
import 'package:fishpi/src/request.dart';

class Article {
  String token = '';

  Article([String? token]) {
    this.token = token ?? this.token;
  }

  /// 发布文章
  ///
  /// - `data` 文章信息
  ///
  /// 返回文章 Id
  Future<String> post(ArticlePost data) async {
    try {
      var rsp = await Request.post(
        'article',
        data: {
          ...data.toJson(),
          'apiKey': token,
        },
      );

      if (rsp['code'] != 0) return Future.error(rsp['msg']);

      return rsp['articleId'];
    } catch (e) {
      return Future.error(e);
    }
  }

  /// 更新文章
  ///
  /// - `id` 文章 Id
  /// - `data` 文章信息
  ///
  /// 返回文章 Id
  Future<String> update(String id, ArticlePost data) async {
    try {
      var rsp = await Request.put(
        'article/$id',
        data: {
          ...data.toJson(),
          'apiKey': token,
        },
      );

      if (rsp['code'] != 0) return Future.error(rsp['msg']);

      return rsp['articleId'];
    } catch (e) {
      return Future.error(e);
    }
  }

  /// 查询文章列表
  ///
  /// - `type` 查询类型
  /// - `tag` 指定查询标签，可选
  /// - `page` 页码
  ///
  /// 返回文章列表
  Future<ArticleList> list({
    required ArticleListType type,
    int page = 1,
    String? tag,
  }) async {
    try {
      var rsp = await Request.get(
        'api/articles/${tag != null ? "tag/$tag" : "recent"}${type.toString()}',
        params: {"p": page, "apiKey": token},
      );

      if (rsp['code'] != 0) return Future.error(rsp['msg']);

      return ArticleList.from(rsp['data']);
    } catch (e) {
      return Future.error(e);
    }
  }

  /// 获取文章详情
  ///
  /// - `id` 文章id
  ///
  /// 返回文章详情
  Future<ArticleDetail> detail(String id, {int p = 1}) async {
    try {
      var rsp = await Request.get(
        'api/article/$id',
        params: {"apiKey": token, "p": p},
      );

      if (rsp['code'] != 0) return Future.error(rsp['msg']);

      return ArticleDetail.from(rsp['data']?['article'] ?? {});
    } catch (e) {
      return Future.error(e);
    }
  }

  /// 点赞/取消点赞文章
  ///
  /// - `id` 文章id
  /// - `type` 点赞类型
  ///
  /// 返回文章点赞状态 VoteType
  Future<int> vote(String id, String type) async {
    try {
      var rsp = await Request.post(
        'vote/$type/article',
        data: {
          'dataId': id,
          'apiKey': token,
        },
      );

      if (rsp['code'] != 0) return Future.error(rsp['msg']);

      return rsp['type'];
    } catch (e) {
      return Future.error(e);
    }
  }
}
