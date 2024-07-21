import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class NetworkConnectivity {
  NetworkConnectivity._();
  static final _instance = NetworkConnectivity._();
  static NetworkConnectivity get instance => _instance;
  final _networkConnectivity = Connectivity();
  final _controller = StreamController.broadcast();
  bool hasConnection = true;
  Stream get myStream => _controller.stream;
  void initialise() {
    // _checkStatus(result);
    _networkConnectivity.onConnectivityChanged.listen((result) {
      if (kDebugMode) {
        print(result);
      }
      _checkStatus(result);
    });
  }

  Future<void> _checkStatus(ConnectivityResult result) async {
    final previosConnection = hasConnection;
    try {
      final result = await InternetAddress.lookup('google.com');
      hasConnection = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      hasConnection = false;
    }
    if (previosConnection != hasConnection) {
      _controller.sink.add({result: hasConnection});
    }
  }

  void disposeStream() => _controller.close();
}
