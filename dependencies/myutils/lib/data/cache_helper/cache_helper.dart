import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:path_provider/path_provider.dart' as path_provider;
enum CacheStorageType {
  flightBox,
  hotelBox,
  comboFlightBox,
  comboHotelBox,
  flightLocations,
  hotelLocations,
  accountBoxForLogin,
  accountBox,
  isBiometricLogIn
}

class CacheHelper {
  SharedPreferences? prefs;

  CacheHelper._();

  static final shared = CacheHelper._();

  // static Future<void> init() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

  static const String cachedLang = "cachedLang";
  static const String cachedAppToken = "cachedAppToken";
  // static const String cachedAccountData = "cachedAccountData";

  // void initCachedMemory() async {
  //   try {
  //     prefs = await SharedPreferences.getInstance();
  //     cacheLanguage(GtdChannelSettingObject.shared.locale ?? "vi");
  //     // cacheAppToken("Bearer ${GtdChannelSettingObject.shared.token}");
  //     if (kDebugMode) {
  //       print("Path initCachedMemory Stream success");
  //     }
  //   } on PlatformException catch (e) {
  //     if (kDebugMode) {
  //       print("Path initCachedMemory PlatformException failed: $e");
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print("Path initCachedMemory failed: $e");
  //     }
  //   }
  // }

  void initCachedStorage({String? directoryPath}) {
    String pathDirectoryHive = directoryPath ?? "";
    if (kDebugMode) {
      print("Path pathDirectoryHive: $pathDirectoryHive");
    }
    if (directoryPath == null) {
      pathDirectoryHive = Directory.systemTemp.path;
      if (kDebugMode) {
        print("Path Temp: $pathDirectoryHive");
      }
    }
    // //Register Adapter Hive Objects
    // Hive
    //   ..init(pathDirectoryHive)
    //   ..registerAdapter(SearchFlightInfoHiveAdapter())
    //   ..registerAdapter(GtdAccountHiveAdapter());
  }

  String getCachedLanguage() {
    final code = prefs?.getString(cachedLang);
    if (code != null) {
      return code;
    } else {
      return 'vi';
    }
  }

  Future<void> cacheLanguage(String code) async {
    await prefs?.setString(cachedLang, code);
    if (kDebugMode) {
      print("Gotadi cacheLanguage: $code");
    }
  }

  String getCachedAppToken() {
    if (prefs == null) {
      if (kDebugMode) {
        print("getCachedAppToken but prefs is null");
      }
    }
    final token = prefs?.getString(cachedAppToken);
    return token ?? "";
    //Handle token null here
  }


  // T? loadSavedObject<T>(T Function(Map<String, dynamic> map) fromJson, {required String key}) {
  //   final String? jsonString = prefs?.getString(key);
  //   if (jsonString != null) {
  //     T? model = JsonParser.jsonToModel(fromJson, json.decode(jsonString));
  //     return model;
  //   }
  //   return null;
  // }

  Future<void> saveSharedObject(Map<String, dynamic> mapObject, {required String key}) async {
    await prefs?.setString(key, json.encode(mapObject));
  }
  Future<void> saveShareBool({required bool value, required String key}) async {
    await prefs?.setBool(key, value);
  }
  //get bool
  bool getShareBool({required String key}) {
    return prefs?.getBool(key) ?? false;
  }
  Future<void> saveShareString({required String value, required String key}) async {
    await prefs?.setString(key, value);
  }
  String getShareString({required String key}) {
    return prefs?.getString(key) ?? "";
  }

  // List<T> loadListSavedObject<T>(T Function(Map<String, dynamic> map) fromJson, {required String key}) {
  //   final List<String>? jsonListString = prefs?.getStringList(key);
  //   if (jsonListString != null) {
  //     List<T> models = JsonParser.jsonArrayToModel(fromJson, jsonListString.map((e) => json.decode(e)).toList());
  //     return models;
  //   }
  //   return [];
  // }



  Future<void> saveListSharedObject(List<Map<String, dynamic>> mapObjects, {required String key}) async {
    await prefs?.setStringList(key, mapObjects.map((e) => json.encode(e)).toList());
  }

  void removeCachedSharedObject(String key) async {
    await prefs?.remove(key);
  }
  void clearDataLocalLogout() {
    // prefs?.clear();
  }

  void removeUserCache() {
    removeCachedSharedObject(cachedAppToken);
    // removeCachedSharedObject(cachedAccountData);
  }
}
