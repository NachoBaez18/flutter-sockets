import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketServices with ChangeNotifier {
  late ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket;

  ServerStatus get serverStatus => _serverStatus;

  IO.Socket get socket => this._socket;

  Function get emit => this._socket.emit;

  SocketServices() {
    this._initConfig();
  }

  void _initConfig() {
    _socket = IO.io('http://192.168.0.10:3000/', {
      'transports': ['websocket'],
      'autoConnect': true
    });

    _socket.on('connect', (_) {
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    _socket.on('disconnect', (_) {
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    // socket.on('nuevo-mensaje', (payload) {
    //   print('nuevo mensaje:');
    //   print('nombre:' + payload['nombre']);
    //   print(payload.containsKey('mensaje') ? payload['mensaje'] : 'no hay');
    // });
  }
}
