import 'dart:io';
import 'dart:math';

import 'base.dart';

enum ArticlePage { list, detail }

class ArticleCmd implements CommandInstance {
  int _page = 1;
  int _commentPage = 1;
  String _tag = '';
  String _type = ArticleListType.Recent;
  ArticleList _current = ArticleList();
  ArticleDetail _currentDetail = ArticleDetail();
  ArticlePage _currentPage = ArticlePage.list;

  @override
  ArgParser command(ArgParser parser) {
    return parser;
  }

  @override
  Future<void> exec(ArgResults args, PrintFn print) async {}

  @override
  Future<bool> call(String command) async {
    if (command.trim().isEmpty) return false;
    var argv = command.trim().split(' ');
    var replyId = '';
    switch (argv[0]) {
      case ':to':
        {
          try {
            if (argv.length < 2) {
              stdout.write('要跳转到哪一页：');
              if (_currentPage == ArticlePage.list) {
                _page = int.parse(stdin.readLineSync() ?? '1');
              } else {
                _commentPage = int.parse(stdin.readLineSync() ?? '1');
              }
            } else {
              if (_currentPage == ArticlePage.list) {
                _page = int.parse(argv[1]);
              } else {
                _commentPage = int.parse(argv[1]);
              }
            }
          } catch (e) {
            _currentPage == ArticlePage.list ? _page = 1 : _commentPage = 1;
          }
          await page(
              ':page article ${_currentPage == ArticlePage.detail ? _currentDetail.oId : ''}');
          break;
        }
      case ':tag':
        {
          if (argv.length < 2) {
            stdout.write('要查看哪个 Tag：');
            _tag = stdin.readLineSync() ?? '';
          } else {
            _tag = argv[1];
          }
          await page(':page article');
          break;
        }
      case ':view':
        {
          String oId = '';
          try {
            if (argv.length < 2) {
              stdout.write('要查看哪一篇：');
              var index = int.parse(stdin.readLineSync() ?? '1');
              if (index > 0 && index <= _current.articles.length) {
                oId = _current.articles[index - 1].oId;
              } else {
                throw Exception('找不到对应编号或索引的文章');
              }
            } else if (argv[1].length == 13) {
              oId = argv[1];
            } else {
              var index = int.parse(argv[1]);
              oId = _current.articles[index - 1].oId;
            }
            await page(':page article $oId');
          } catch (e) {
            print('找不到对应编号或索引的文章');
          }
          break;
        }
      case ':all':
        {
          _tag = '';
          _page = 1;
          await page(':page article');
          break;
        }
      case ':next':
        {
          if (_currentPage == ArticlePage.list) {
            _page++;
            await page(':page article');
          } else {
            _commentPage++;
            await page(':page article ${_currentDetail.oId}');
          }
          break;
        }
      case ':prev':
        {
          if (_currentPage == ArticlePage.list) {
            _page = max(1, _page - 1);
            await page(':page article');
          } else {
            _commentPage = max(1, _commentPage - 1);
            await page(':page article ${_currentDetail.oId}');
          }
          break;
        }
      case ':type':
        {
          if (argv.length < 2 || ArticleListType.values.contains(argv[1])) {
            stdout.write('要按哪个维度查看文章(${ArticleListType.values.join(', ')})：');
            _type = stdin.readLineSync() ?? '';
          } else {
            _type = argv[1];
          }
          await page(':page article');
          break;
        }
      case ':reply':
        {
          try {
            if (_currentPage != ArticlePage.detail) break;

            if (Platform.isWindows) {
              print('命令发送评论不支援 Windows 端。');
              break;
            }

            if (!Instance.get.isLogin) {
              print('请先登录。');
              break;
            }

            if (argv.length < 2) {
              stdout.write('要回复哪一条评论：');
              var index = int.parse(stdin.readLineSync() ?? '1');
              if (index > 0 && index <= _current.articles.length) {
                replyId = _currentDetail.articleComments[index - 1].oId;
              } else {
                throw Exception('找不到对应编号的评论');
              }
            } else {
              var index = int.parse(argv[1]);
              replyId = _currentDetail.articleComments[index - 1].oId;
            }

            var content = argv.length > 2
                ? argv.skip(2).join(' ')
                : stdin.readLineSync() ?? '';
            await comment(CommentPost(
              articleId: _currentDetail.oId,
              content: content,
              replyId: replyId,
            ));
          } catch (e) {
            print('找不到对应编号的评论');
            break;
          }
          break;
        }
      default:
        {
          if (_currentPage != ArticlePage.detail) break;

          if (Platform.isWindows) {
            print('命令发送评论不支援 Windows 端。');
            break;
          }

          if (!Instance.get.isLogin) {
            print('请先登录。');
            break;
          }

          await comment(CommentPost(
            articleId: _currentDetail.oId,
            content: command,
          ));
        }
    }
    return true;
  }

  comment(CommentPost comment) {
    return Instance.get.comment.send(comment).then((value) => {
          _commentPage = (_currentDetail.pagination?.paginationPageCount ?? 1) +
              (_currentDetail.articleComments.length == 30 ? 1 : 0),
          page(':page article ${_currentDetail.oId}')
        });
  }

  @override
  Future<bool> page(String command) async {
    try {
      print('${Command.clearScreen}${Command.moveTo(0, 0)}');
      int page = _page;
      String tag = _tag;
      String type = _type;
      final commands = command.trim().split(' ');
      if (commands.length > 2 &&
          commands[2].isNotEmpty &&
          ArticleListType.values.contains(commands[2])) {
        type = commands[2];
      } else if (commands.length > 2 && commands[2].length == 13) {
        if (commands[2] != _currentDetail.oId) {
          _commentPage = 1;
        }
        await Instance.get.article
            .detail(commands[2], p: _commentPage)
            .then((value) {
          _currentDetail = value;
          _currentPage = ArticlePage.detail;
          print(
              '${Command.bold}${_currentDetail.articleTitleEmoj}${Command.restore}');
          print(
              '${Command.from('#555555').color}👤 ${_currentDetail.articleAuthor.name} | 👀  ${_currentDetail.articleHeat} | 👍  ${_currentDetail.articleGoodCnt} | ❤️  ${_currentDetail.articleThankCnt} ${Command.restore}');
          print(htmlToText(_currentDetail.articleContent));
          print(
              '------ 评论 ($_commentPage / ${_currentDetail.pagination?.paginationPageCount ?? 1}) ------');
          for (var i = 0; i < _currentDetail.articleComments.length; i++) {
            var item = _currentDetail.articleComments[i];
            print(
                '${Command.from('#AAAAAA').color}{${i + 1}} ${Command.from('#888888').color}${Command.bold}${item.commenter.name}${Command.restore} ${Command.from('#555555').color}[${item.commentCreateTimeStr}]${Command.restore}: ${htmlToText(item.commentContent)}');
          }
        }).catchError((error) {
          print('找不到对应编号的文章');
          _currentPage = ArticlePage.list;
        });
        return true;
      } else if (commands.length > 2 &&
          RegExp(r'^\d+$').hasMatch(commands[2])) {
        page = int.parse(commands[2]);
      }

      await Instance.get.article
          .list(type: type, page: page, tag: tag)
          .then((list) {
        for (var i = 0; i < list.articles.length; i++) {
          var item = list.articles[i];
          print(
              '${(i + 1).toString().padLeft(2, '0')}.${Command.bold}${Command.from('#555555').color}[${item.articleAuthor.name}]${Command.restore} ${item.articleTitleEmoj}${Command.from('#222222').back}${Command.from('#a1e999').color} ${item.articleHeat} ${Command.restore}');
        }
        print('第 $page / ${list.pagination.paginationPageCount} 页');
        _current = list;
      });
    } catch (e) {
      print('未知异常：$e');
    }

    return true;
  }
}
