import 'dart:io';

import '../main.dart';
import 'base.dart';

class ChatCmd implements CommandInstance {
  String currentUser = '';
  @override
  ArgParser command(ArgParser parser) {
    return parser
      ..addOption('chat', abbr: 'c', help: '私聊对象')
      ..addOption('say', abbr: 's', help: '私聊内容');
  }

  @override
  Future<void> exec(ArgResults args, PrintFn print) async {
    var chat = args['chat'];
    var say = args['say'];

    if (chat != null) {
      currentUser = chat;
      setCurrentPage(CommandPage.chatroom);
      if (say != null) {
        Instance.get.chat.send(chat, say);
        exit(0);
      }
      Instance.get.chat.connect(user: chat);
    }
  }

  @override
  Future<bool> call(String command) async {
    if (command.trim().isEmpty) return false;
    if (!Instance.get.isLogin) {
      print('请先登录。');
      return false;
    }
    var argv = command.trim().split(' ');
    switch (argv[0]) {
      case ':chat':
        {
          if (argv.length > 1) {
            currentUser = argv[1];
            await page(':page chat $currentUser');
            if (argv.length > 2) {
              await Instance.get.chat.send(currentUser, argv[2]);
            }
          } else {
            currentUser = '';
            await page(':page chat');
          }
          break;
        }
      default:
        {
          if (currentUser.isEmpty) {
            return call(':chat $command');
          } else if (!Platform.isWindows) {
            print('命令发送消息不支援 Windows 端。请使用 --say 命令行参数发送，--chat 指定接收者。');
          } else {
            Instance.get.chat.send(currentUser, command);
          }
        }
    }
    return true;
  }

  @override
  Future<bool> page(String command) async {
    final commands = command.trim().split(' ');
    if (commands.length > 2 && commands[2].isNotEmpty) {
      currentUser = commands[2];
    }
    if (currentUser.isEmpty) {
      print('聊天列表：');
      await Instance.get.chat.list().then(
          (value) => {for (var item in value.reversed) print(itemView(item))});
    } else {
      print('聊天历史：');
      Instance.get.chat.get(user: currentUser).then(
          (value) => {for (var item in value.reversed) print(msgView(item))});
    }
    return true;
  }

  String msgView(ChatData msg) {
    return '${Command.bold}${msg.senderUserName}${Command.from('#AAAAAA').color} [${msg.time}]${Command.restore}: ${htmlToText(msg.content, userName: Instance.get.user.current.userName).replaceAll('\n', '')}';
  }

  String itemView(ChatData msg) {
    return '${Command.bold}${msg.senderUserName == Instance.get.user.current.userName ? msg.receiverUserName : msg.senderUserName}${Command.from('#AAAAAA').color} [${msg.time}]${Command.restore}\t';
  }
}
