class ChatData {
  String toId;
  String preview;
  String userSession;
  String senderAvatar;
  String markdown;
  String receiverAvatar;
  String oId;
  String time;
  String fromId;
  String senderUserName;
  String content;
  String receiverUserName;

  ChatData({
    required this.toId,
    required this.preview,
    required this.userSession,
    required this.senderAvatar,
    required this.markdown,
    required this.receiverAvatar,
    required this.oId,
    required this.time,
    required this.fromId,
    required this.senderUserName,
    required this.content,
    required this.receiverUserName,
  });

  ChatData.from(Map<String, dynamic> data)
      : toId = data['toId'] ?? '',
        preview = data['preview'] ?? '',
        userSession = data['user_session'] ?? '',
        senderAvatar = data['senderAvatar'] ?? '',
        markdown = data['markdown'] ?? '',
        receiverAvatar = data['receiverAvatar'] ?? '',
        oId = data['oId'] ?? '',
        time = data['time'] ?? '',
        fromId = data['fromId'] ?? '',
        senderUserName = data['senderUserName'] ?? '',
        content = data['content'] ?? '',
        receiverUserName = data['receiverUserName'] ?? '';

  Map<String, dynamic> toJson() => {
        'toId': toId,
        'preview': preview,
        'user_session': userSession,
        'senderAvatar': senderAvatar,
        'markdown': markdown,
        'receiverAvatar': receiverAvatar,
        'oId': oId,
        'time': time,
        'fromId': fromId,
        'senderUserName': senderUserName,
        'content': content,
        'receiverUserName': receiverUserName,
      };

  @override
  String toString() {
    return 'ChatData{ toId: $toId, preview: $preview, userSession: $userSession, senderAvatar: $senderAvatar, markdown: $markdown, receiverAvatar: $receiverAvatar, oId: $oId, time: $time, fromId: $fromId, senderUserName: $senderUserName, content: $content, receiverUserName: $receiverUserName }';
  }
}

class ChatNotice {
  String command;
  String userId;
  String? preview;
  String? senderAvatar;
  String? senderUserName;

  ChatNotice({
    required this.command,
    required this.userId,
    this.preview,
    this.senderAvatar,
    this.senderUserName,
  });

  ChatNotice.from(Map<String, dynamic> data)
      : command = data['command'] ?? '',
        userId = data['userId'] ?? '',
        preview = data['preview'],
        senderAvatar = data['senderAvatar'],
        senderUserName = data['senderUserName'];

  Map<String, dynamic> toJson() => {
        'command': command,
        'userId': userId,
        'preview': preview,
        'senderAvatar': senderAvatar,
        'senderUserName': senderUserName,
      };

  @override
  String toString() {
    return 'NoticeMsg{ command: $command, userId: $userId, preview: $preview, senderAvatar: $senderAvatar, senderUserName: $senderUserName }';
  }
}

typedef ChatRevoke = String;

enum ChatMsgType {
  notice,
  data,
  revoke,
}

typedef ChatListener = void Function(
  ChatMsgType type, {
  ChatNotice? notice,
  ChatData? data,
  ChatRevoke? revoke,
});
