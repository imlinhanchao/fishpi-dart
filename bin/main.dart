import 'dart:convert';
import 'dart:io';

import 'src/base.dart';
import 'src/user.dart';
import 'src/chatroom.dart';
import 'src/utils.dart';

enum CommandPage {
  utils,
  user,
  chatroom,
}

var commands = {
  CommandPage.utils: UtilsCmd(),
  CommandPage.user: UserCmd(),
  CommandPage.chatroom: ChatRoomCmd(),
};

CommandPage currentPage = CommandPage.user;

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
        case '/quit':
          exit(0);
        case '/page':
          for (var element in CommandPage.values) {
            if (element.name == commandArgs[1]) {
              currentPage = element;
            }
          }
          stdout.write('\x1B[2J\x1B[0;0H');
          commands[currentPage]?.page(command);
          break;
        default:
          stdout.write('\x1B[1A\x1B[2K');
          if (commands[currentPage] != null) {
            commands[currentPage]?.call(command);
          }
          break;
      }
    }
  });
}

void main(List<String> arguments) async {
  var parser = registerCommand(commands.values.toList());
  final args = parser.parse(arguments);

  if (args['help']) {
    print(parser.usage);
    return;
  }

  for (var cmd in commands.entries) {
    await cmd.value.exec(args, pagePrint(cmd.key));
  }

  currentPage = CommandPage.chatroom;
  await commands[currentPage]?.page('');

  // 如果不是 Windows 系统
  readCommand();
}
