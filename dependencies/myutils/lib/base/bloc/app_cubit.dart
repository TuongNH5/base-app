import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:myutils/base/bloc/app_state.dart';


class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState()) {
    _checkInternetStatus();
    _listenConnectivity();
    _listenInternetConnectionStatus();
  }

  StreamSubscription? _connectivitySubscription;
  StreamSubscription? _internetConnectionStatusSubscription;

  Future<void> _listenConnectivity() async {
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((event) async {
      // logger.d('connectivity changed: $event');
      if (event != ConnectivityResult.none) {
        final internetConnectionStatus =
            await InternetConnectionChecker().connectionStatus;
        emit(state.copyWith(
            internetConnectionStatus: internetConnectionStatus,
            connectivityResult: event));
      } else {
        emit(state.copyWith(
          connectivityResult: event,
        ));
      }
    });
  }

  Future<void> _listenInternetConnectionStatus() async {
    _internetConnectionStatusSubscription =
        InternetConnectionChecker().onStatusChange.listen((event) {
      // logger.d('internet connection status changed: $event');
      emit(state.copyWith(
        internetConnectionStatus: event,
      ));
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    _internetConnectionStatusSubscription?.cancel();
    return super.close();
  }

  Future<void> _checkInternetStatus() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final internetConnectionStatus =
        await InternetConnectionChecker().connectionStatus;
    emit(state.copyWith(
      connectivityResult: connectivityResult,
      internetConnectionStatus: internetConnectionStatus,
    ));
  }
}
