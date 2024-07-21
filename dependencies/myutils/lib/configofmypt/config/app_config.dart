/// Created by Nguyen Huu Tu on 28/03/2022.
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserType {
  static const int employee = 0;
  static const int partner = 1;
}

class AppConfig {
  //Config in local
  String? baseUrl;
  String? primaryColor;
  Flavor? flavor;
  String? apiVersion;
  String appName = 'My PT';
  bool debugTag = true;
  int cacheDuration = 100;
  String initialRoute = '';
  String? domainChat = '';
  String? appVersion = '';
  String? firebaseConfigVersion = '';

  String? sentryDNS = '';

  //Config from server
  // UserConfigData? userConfigData;
  // UserInfoData? userInfoData;

  AppConfig._init(this.flavor);

  static Future<AppConfig> staging() async {
    final appConfig = AppConfig._init(Flavor.staging);
    return appConfig._loadConfig();
  }

  static Future<AppConfig> production() async {
    final appConfig = AppConfig._init(Flavor.production);
    return appConfig._loadConfig();
  }

  bool isProduction() => flavor == Flavor.production;

  Future<AppConfig> _loadConfig() async {
    //Read config from .env file
    try {

      // await dotenv.load(fileName: 'resources/common_resource/assets/env/env.uat');
      await dotenv.load(fileName: 'packages/common_resource/assets/env/env.uat');


      // await dotenv.load();
      // primaryColor = dotenv.env[ConfigConstants.themeColor] ?? '';
      apiVersion = dotenv.env[ConfigConstants.apiVersion] ?? '';
      appVersion = dotenv.env[ConfigConstants.appVersion] ?? '';
      firebaseConfigVersion = dotenv.env[ConfigConstants.firebaseConfigVersion] ?? '';
      //for chat
      sentryDNS = dotenv.env[ConfigConstants.sentryDNS] ?? '';

      cacheDuration = 100;
      switch (flavor) {
        case Flavor.staging:
          baseUrl = dotenv.env[ConfigConstants.domainStaging] ?? '';
          debugTag = true;
          break;

        default:
          baseUrl = dotenv.env[ConfigConstants.domainProduction] ?? '';
          debugTag = false;
          break;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    // final localeManager = LocaleManager.instance..setStringValue(StorageKeys.baseUrl, baseUrl ?? '');
    // userConfigData = localeManager.getAppConfig();
    // userInfoData = localeManager.getUserInfo();
    //
    // //clear cache if version app difference version local storage
    // if (localeManager.getString(StorageKeys.appVersion) != appVersion) {
    //   localeManager
    //     ..clearCache()
    //     ..setStringValue(StorageKeys.appVersion, appVersion);
    // }
    //
    // // Case show boarding screen
    // final onBoarding = localeManager.getBool(StorageKeys.onBoarding);
    // if (onBoarding == false) {
    //   initialRoute = AppRouter.onboarding;
    //   return this;
    // }
    // // Case required access token
    // final accessToken = localeManager.getString(StorageKeys.accessToken);
    // if (accessToken.isNull()) {
    //   initialRoute = AppRouter.welcome;
    //   return this;
    // }
    // initialRoute = AppRouter.home;
    // initialRoute = AppRouter.home;

    return this;
  }
}

class ConfigConstants {
  static const themeColor = 'THEME_COLOR';
  static const domainProduction = 'DOMAIN_PRODUCTION';
  static const domainStaging = 'DOMAIN_STAGING';
  static const apiVersion = 'API_VERSION';
  static const cacheDuration = 'CACHE_DURATION';
  static const domainChat = 'DOMAIN_CHAT';
  static const appVersion = 'APP_VERSION';
  static const sentryDNS = 'SENTRY_DNS';
  static const firebaseConfigVersion = 'FIREBASE_CONFIG_VERSION';
  static const API_URL = 'API_URL';

  //for chat

  static const sipDomain = 'sipDomain';
  static const expiredTime = 'expiredTime';
  static const sipPassword = 'sipPassword';
  static const sipProxy = 'sipProxy';
  static const sipTransport = 'sipTransport';
}

enum Flavor { staging, production }
