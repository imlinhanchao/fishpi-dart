import 'dart:io';
import 'dart:math';

import 'base.dart';

enum ArticlePage { list, detail }

class ArticleCmd implements CommandInstance {
  int _page = 1;
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
    switch (argv[0]) {
      case ':to':
        {
          try {
            if (argv.length < 2) {
              stdout.write('要跳转到哪一页：');
              _page = int.parse(stdin.readLineSync() ?? '1');
            } else {
              _page = int.parse(argv[1]);
            }
          } catch (e) {
            _page = 1;
          }
          await page(':page article');
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
          await page(':page article');
          break;
        }
      case ':next':
        {
          _page++;
          await page(':page breezemoon');
          break;
        }
      case ':prev':
        {
          _page = max(1, _page - 1);
          await page(':page breezemoon');
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
      default: {
        if (_currentPage == ArticlePage.detail) {
          // 添加评论
        }
      }
    }
    return true;
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
      } else if (commands[2].length == 13) {
        await Instance.get.article.detail(commands[2]).then((value) {
          _currentDetail = value;
          _currentPage = ArticlePage.detail;
          print(
              '${Command.bold}${_currentDetail.articleTitleEmoj}${Command.restore}');
          print(
              '${Command.from('#555555')}👤${_currentDetail.articleAuthor.name} | 👀${_currentDetail.articleHeat} | 👍${_currentDetail.articleGoodCnt} | ❤️${_currentDetail.articleThankCnt} ${Command.restore}');
          print(htmlToText(_currentDetail.articleContent));
        }).catchError((error) {
          print('找不到对应编号的文章');
          _currentPage = ArticlePage.list;
        });
        return true;
      } else if (RegExp(r'^\d+$').hasMatch(commands[2])) {
        page = int.parse(commands[2]);
      }

      Instance.get.article.list(type: type, page: page, tag: tag).then((list) {
        for (var item in list.articles) {
          print(
              '${Command.bold}${item.articleTitleEmoj}${Command.restore}[${item.articleAuthor.name}] ${Command.from('#555555')}${Command.reverse}${item.articleHeat}${Command.restore}');
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
