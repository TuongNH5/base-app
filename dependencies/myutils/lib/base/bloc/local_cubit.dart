import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:myutils/base/bloc/local_state.dart';
import 'package:myutils/constants/app_const.dart';
import 'package:myutils/data/cache_helper/cache_helper.dart';
import 'package:myutils/data/configuration/gtd_app_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    CacheHelper.shared.initCachedMemory();
  }

  void initSetting({String? lang}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lang = prefs.getString('cachedLang') ?? 'vi';

    MyAppScheme appScheme = AppConst.shared.appScheme;
    // String pathForAssetEnv = GtdString.pathForAsset(AppConst.shared.commonResource, 'assets/env/${appScheme.envFile}');
    //
    // await dotenv.load(fileName: pathForAssetEnv);

    await CacheHelper.shared.cacheLanguage(lang);

    Locale cachedLocale = Locale(lang);
    LocalSettingState settingState =
        LocalSettingState(locale: cachedLocale, packageResource: appScheme.packageResoure.resource);
    emit(settingState);
  }

  @override
  Future<void> close() {
    Hive.close();
    return super.close();
  }
}
