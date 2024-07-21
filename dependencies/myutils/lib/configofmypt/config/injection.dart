import 'dart:isolate';


import 'package:flutter/foundation.dart' show FlutterError;
import 'package:get_it/get_it.dart';

import '../../data/network/network_manager.dart';
import '../../data/repositories/news_events_repository.dart';
import 'app_config.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies(Flavor appFlavor) async {
  //init local storage
  // await LocaleManager.init();
  // injector.registerSingleton<LocaleManager>(LocaleManager.instance);
  if (appFlavor == Flavor.production) {
    injector.registerSingleton<AppConfig>(await AppConfig.production());
  } else {
    injector.registerSingleton<AppConfig>(await AppConfig.staging());
  }
  // injector.registerLazySingleton<WeatherRepository>(WeatherRepository.new);
  injector.registerSingleton<NetworkManager>(NetworkManager());
  // injector.registerSingleton<AppNavigator>(AppNavigator.instance);
  injector.registerLazySingleton<NewsEventsRepository>(NewsEventsRepository.new);

  // await initFirebaseService();
  // injector
  //   ..registerSingleton<LogzIoLogger>(LogzIoLogger.createLogger())
  //   ..registerSingleton<DataBaseHelper>(DataBaseHelper())
  //
  //   // network
  //
  //   ..registerSingleton<NetworkManager>(NetworkManager())
  //   ..registerLazySingleton<AuthRepository>(AuthRepository.new)
  //   ..registerLazySingleton<ProfileRepository>(ProfileRepository.new)
  //   ..registerLazySingleton<CheckinRepository>(CheckinRepository.new)
  //   ..registerLazySingleton<NewsEventsRepository>(NewsEventsRepository.new)
  //   ..registerLazySingleton<SettingRepository>(SettingRepository.new)
  //   ..registerLazySingleton<ChatRepository>(ChatRepository.new)
  //   ..registerLazySingleton<NotificationRepository>(NotificationRepository.new)
  //   ..registerLazySingleton<PunishRepository>(PunishRepository.new)
  //   ..registerLazySingleton<MediaRepository>(MediaRepository.new)
  //   ..registerLazySingleton<JobRepository>(JobRepository.new)
  //   ..registerLazySingleton<IqcRepository>(IqcRepository.new);
}

Future<void> initFirebaseService() async {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //
  // //crashytics
  // final appConfig = injector<AppConfig>();
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  // FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // FirebaseCrashlytics.instance
  //     .setUserIdentifier(appConfig.userInfoData?.email ?? '');
  //
  // FirebaseCrashlytics.instance
  //     .setCustomKey('name', appConfig.userInfoData?.name ?? '');
  // FirebaseCrashlytics.instance
  //     .setCustomKey('email', appConfig.userInfoData?.email ?? '');
  // Isolate.current.addErrorListener(RawReceivePort((pair) async {
  //   logger.d('error: ');
  //   logger.d(pair);
  //   final List<dynamic> errorAndStacktrace = pair;
  //   await FirebaseCrashlytics.instance.recordError(
  //     errorAndStacktrace.first,
  //     errorAndStacktrace.last as StackTrace?,
  //   );
  // }).sendPort);
  // // FirebaseCrashlytics.instance.crash();
  //
  // //deeplink
  // initDynamicLinks();
  //
  // injector.registerSingleton<RemoteConfigManager>(RemoteConfigManager.init());
  //
  // FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
}
