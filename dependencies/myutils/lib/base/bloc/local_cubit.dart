import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:myutils/base/bloc/local_state.dart';
import 'package:myutils/data/cache_helper/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/extension/string_extension.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit() : super(LocalInitState());

  void getSavedLanguage() {
    final cachedLanguageCode = CacheHelper.shared.getCachedLanguage();
    emit(LocalLanguageState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String lang) async {
    await CacheHelper.shared.cacheLanguage(lang);
    emit(LocalLanguageState(locale: Locale(lang)));
  }

  void initCached() async {
    CacheHelper.shared.initCachedStorage();
  }

  void initSetting({String? lang}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lang = prefs.getString('cachedLang') ?? 'vi';
    await CacheHelper.shared.cacheLanguage(lang);
  }

  @override
  Future<void> close() {
    Hive.close();
    return super.close();
  }
}
