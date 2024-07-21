import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppState extends Equatable implements CachedWidgetState {
  final ConnectivityResult? connectivityResult;
  final InternetConnectionStatus? internetConnectionStatus;

  const AppState({
    this.connectivityResult,
    this.internetConnectionStatus,
  });

  @override
  List<Object?> get props => [connectivityResult, internetConnectionStatus];

  //copyWith
  AppState copyWith({
    ConnectivityResult? connectivityResult,
    InternetConnectionStatus? internetConnectionStatus,
  }) {
    return AppState(
      connectivityResult: connectivityResult ?? this.connectivityResult,
      internetConnectionStatus:
          internetConnectionStatus ?? this.internetConnectionStatus,
    );
  }

  @override
  bool get stringify => true;

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    return AppState(
      connectivityResult: getConnectivityResultFromString(
          json['connectivityResult'] as String?),
      internetConnectionStatus: getInternetConnectionStatusFromString(
          json['internetConnectionStatus'] as String?),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'connectivityResult': connectivityResult.toString(),
      'internetConnectionStatus': internetConnectionStatus.toString(),
    };
  }

  ConnectivityResult getConnectivityResultFromString(String? value) {
    switch (value) {
      case 'ConnectivityResult.none':
        return ConnectivityResult.none;
      case 'ConnectivityResult.mobile':
        return ConnectivityResult.mobile;
      case 'ConnectivityResult.wifi':
        return ConnectivityResult.wifi;
      case 'ConnectivityResult.ethernet':
        return ConnectivityResult.ethernet;
      case 'ConnectivityResult.bluetooth':
        return ConnectivityResult.bluetooth;
      case 'ConnectivityResult.vpn':
        return ConnectivityResult.vpn;
      default:
        return ConnectivityResult.none;
    }
  }

  InternetConnectionStatus getInternetConnectionStatusFromString(
      String? value) {
    switch (value) {
      case 'InternetConnectionStatus.connected':
        return InternetConnectionStatus.connected;
      case 'InternetConnectionStatus.disconnected':
        return InternetConnectionStatus.disconnected;
      default:
        return InternetConnectionStatus.disconnected;
    }
  }
}
abstract class CachedWidgetState {
  CachedWidgetState.empty();
  CachedWidgetState? fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}