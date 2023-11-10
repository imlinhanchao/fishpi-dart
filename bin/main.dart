import 'dart:convert';
import 'dart:io';

import 'src/base.dart';
import 'src/utils.dart';
import 'src/user.dart';
import 'src/chatroom.dart';
import 'src/chat.dart';

enum CommandPage {
  utils,
  user,
  chatroom,
  chat,
}

var commands = {
  CommandPage.utils: UtilsCmd(),
  CommandPage.user: UserCmd(),
  CommandPage.chatroom: ChatRoomCmd(),
  CommandPage.chat: ChatCmd(),
};

CommandPage currentPage = CommandPage.user;
void setCurrentPage(CommandPage page) {
  currentPage = page;
}

PrintFn pagePrint(CommandPage page) {
  return (dynamic msg, [bool newLine = true]) {
    if (currentPage == page) (newLine ? print : stdout.write)(msg);
  };
}

readCommand() async {
  List<int> lstCharCode = [];
  stdin.listen((data) {
    lstCharCode.addAll(data);
    if (data.last == 10 || data.last == 13) {
      var command = Utf8Decoder().convert(lstCharCode).trim();
      lstCharCode.clear();
      var commandArgs = command.split(' ');

      switch (commandArgs[0]) {
        case ':quit':
        case ':q':
          exit(0);
        case ':page':
          for (var element in CommandPage.values) {
            if (element.name == commandArgs[1]) {
              currentPage = element;
            }
          }
          stdout.write('${Command.clearScreen}${Command.moveTo(0, 0)}');
          commands[currentPage]?.page(command);
          break;
        default:
          stdout.write('${Command.moveUp(1)}${Command.clearLine}');
          if (commands[currentPage] != null) {
            commands[currentPage]?.call(command);
          }
          break;
      }
    }
  });
}

void main(List<String> arguments) async {
  var parser = registerCommand(commands.values.toList())
    ..addFlag('help', abbr: 'h')
    ..addOption('page',
        help: '切换启动页面',
        allowed: CommandPage.values.skip(1).map((e) => e.name).toList(),
        defaultsTo: 'chatroom');

  late ArgResults args;

  try {
    args = parser.parse(arguments);
  } catch (e) {
    print('命令行参数错误！\n');
    print(parser.usage);
    return;
  }

  if (args['help']) {
    print(parser.usage);
    return;
  }

  for (var cmd in commands.entries) {
    await cmd.value.exec(args, pagePrint(cmd.key));
  }

  if (args['page'] != null) {
    CommandPage.values
        .where((element) => element.name == args['page'])
        .forEach((element) {
      currentPage = element;
    });
  }

  await commands[currentPage]?.page('');

  // 如果不是 Windows 系统
  readCommand();
}
