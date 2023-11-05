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

late CommandPage currentPage;

void Function(dynamic msg) pagePrint(CommandPage page) {
  return (dynamic msg) {
    if (currentPage == page) print(msg);
  };
}

void main(List<String> arguments) async {
  var parser = registerCommand(commands.values.toList());
  final args = parser.parse(arguments);
  currentPage = CommandPage.chatroom;

  commands[currentPage]?.page('');

  for (var cmd in commands.entries) {
    cmd.value.exec(args, pagePrint(cmd.key));
  }

  bool running = true;

  do {
    final String input =
        stdin.readLineSync(encoding: Encoding.getByName('utf-8')!) ?? '';
    var inputArgs = input.split(' ');

    switch (inputArgs[0]) {
      case '/quit':
        running = false;
        break;
      case '/page':
        for (var element in CommandPage.values) {
          if (element.name == inputArgs[1]) {
            currentPage = element;
          }
        }
        stdout.write('\x1B[2J\x1B[0;0H');
        commands[currentPage]?.page(input);
        break;
      default:
        if (commands[currentPage] != null) {
          await commands[currentPage]?.call(input);
        }
        break;
    }

    await Future<void>.delayed(const Duration(milliseconds: 10));
  } while (running);
}
