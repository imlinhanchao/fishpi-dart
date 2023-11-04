import 'dart:async';

import 'package:fishpi/fishpi.dart';
import 'package:fishpi/src/request.dart';
import 'package:web_socket_channel/io.dart';

class Chatroom {
  String _apiKey = '';
  String _client = ClientType.Other;
  String _version = 'Latest';
  WebsocketInfo? _ws;
  String _discusse = '';
  List<Function(Message)> _wsCallbacks = [];
  List<dynamic> _onlines = [];

  void setToken(String token) {
    _apiKey = token;
  }

  void setVia(String client, String version) {
    _client = client;
    _version = version;
  }

  /// 当前在线人数列表，需要先调用 addListener 添加聊天室消息监听
  get onlines => _onlines;

  /// 当前聊天室话题，需要先调用 addListener 添加聊天室消息监听
  get discusse => _discusse;

  /// 設置当前聊天室话题
  set discusse(val) {
    send('[setdiscuss]$val[/setdiscuss]');
  }

  Future<void> send(String msg, {String? clientType, String? version}) async {
    try {
      var rsp = await Request.post(
        'chat-room/send',
        data: {
          'content': msg,
          'client': '${clientType ?? _client}/${version ?? _version}',
          'apiKey': _apiKey,
        },
      );
      if (rsp['code'] != 0) return Future.error(rsp['msg']);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future reconnect(
      {int timeout = 10, Function(dynamic)? error, Function? close}) async {
    if (_ws != null) {
      _ws?.steam.cancel();
      _ws?.ws.sink.close();
    }
    _ws = Request.connect(
      'chat-room-channel',
      params: {'apiKey': _apiKey},
      onMessage: (msg) {
        dynamic data;
        switch (msg['type']) {
          case 'online':
            {
              _onlines = List.from(msg['users'])
                  .map((e) => OnlineInfo.from(e))
                  .toList();
              _discusse = msg['discussing'];
              data = _onlines;
              break;
            }
          case 'discussChanged':
            {
              data = msg['newDiscuss'];
              break;
            }
          case 'revoke':
            {
              data = msg['oId'];
              break;
            }
          case 'barrager':
            {
              data = BarragerMsg.from(msg);
              break;
            }
          case 'msg':
            {
              data = ChatRoomMsg.from(msg);
              msg['type'] = data.isRedpacket ? 'redPacket' : msg['type'];
              break;
            }
          case 'redPacketStatus':
            {
              data = RedPacketStatusMsg.from(msg);
              break;
            }
          case 'customMessage':
            {
              data = msg['message'];
              break;
            }
          default:
            {
              data = msg;
              break;
            }
        }
        for (var call in _wsCallbacks) {
          call(Message(msg['type'], data));
        }
      },
      onClose: (IOWebSocketChannel ws) => {
        Timer(Duration(milliseconds: timeout), () {
          if (close != null) close();
          ws.sink.close();
          _ws?.steam.cancel();
          _ws = null;
          reconnect(timeout: timeout, error: error);
        }),
      },
      onError: (error, ws) => {if (error != null) error(error)},
    );
  }

  void clearListener() {
    _wsCallbacks = [];
  }

  void removeListener(Function(Message) wsCallback) {
    _wsCallbacks.remove(wsCallback);
  }

  Future addListener(Function(Message) wsCallback,
      {int timeout = 10, Function(dynamic)? error, Function? close}) async {
    if (_ws != null && !_wsCallbacks.contains(wsCallback)) {
      _wsCallbacks.add(wsCallback);
      return;
    }
    _wsCallbacks.add(wsCallback);
    await reconnect(timeout: timeout, error: error, close: close);
  }
}
