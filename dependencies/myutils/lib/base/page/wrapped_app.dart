import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:myutils/base/bloc/local_cubit.dart';
import 'package:myutils/base/bloc/local_state.dart';
import 'package:myutils/base/settings/setting_cupid.dart';
import 'package:myutils/constants/app_const.dart';
import 'package:myutils/data/configuration/gtd_app_config.dart';
import 'package:myutils/helpers/extension/string_extension.dart';
import 'package:myutils/utils/app_bloc_observer/app_bloc_observer.dart';


class WrappedApp {
  WrappedApp._() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      afterBuild();
    });
  }

  static final shared = WrappedApp._();

  Future<void> afterBuild() async {
    // Carefull when add method async here => Because of error isolate when build framework
    await EasyLocalization.ensureInitialized();
  }

  //How to get path packages: 'packages/${package}/${assetName}'
  Widget createWrappedApp(GoRouter appRouter, String appTitle,
      {MyAppScheme appScheme = MyAppScheme.uatvib, ThemeMode? themeMode}) {
    // return EasyLocalization(
    //   supportedLocales: const [
    // MARK:  Get subtags from environment (don't implement)
    //     Locale.fromSubtags(languageCode: 'vi'),
    //     Locale.fromSubtags(languageCode: 'en'),
    //   ],
    //   path: GtdString.pathForAsset(AppConst.packageVIB, 'assets/translations'),
    //   saveLocale: false,
    //   fallbackLocale: const Locale('vi'),
    //   useOnlyLangCode: true,
    //   startLocale: Locale(language),
    //   child: GtdBaseApp(
    //     router: appRouter,
    //     title: appTitle,
    //   ),
    // );

    /// Binding Bloc Observable
    Bloc.observer = AppBlocObserver();

    /// Cache Init
    // CacheHelper.shared.initCachedStorage();
    // CacheHelper.shared.initCachedMemory();
    // CacheHelper.shared.cacheLanguage(language);
    // CacheHelper.shared.cacheAppToken("Bearer ${GtdChannelSettingObject.shared.token}");

    /// Set app scheme
    AppConst.shared.appScheme = appScheme;
    AppConst.shared.themeMode = themeMode ?? ThemeMode.light;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LocalCubit()
              ..initCached()
              ..initSetting()),
      ],
      child: BlocBuilder<LocalCubit, LocalState>(
        builder: (context, settingState) {
          if (settingState is LocalSettingState) {
            return EasyLocalization(
              supportedLocales: const [
                //MARK:  Get subtags from environment (don't implement)
                Locale.fromSubtags(languageCode: 'vi'),
                Locale.fromSubtags(languageCode: 'en'),
              ],
              // path: GtdString.pathForAsset(settingState.packageResource, 'assets/translations'),
              path: 'assets/translations',
              saveLocale: false,
              fallbackLocale: const Locale('vi'),
              useOnlyLangCode: true,
              startLocale: settingState.locale,
              child: MyBaseApp(
                router: appRouter,
                title: appTitle,
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class MyBaseApp extends StatelessWidget {
  const MyBaseApp({super.key, required this.router, required this.title});
  final GoRouter router;
  final String title;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SettingCubit()),
        ],
        child: BlocBuilder<SettingCubit, ThemeData>(builder: (context, state) {
          return MaterialApp.router(
              // routerConfig: router,
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
              routerDelegate: router.routerDelegate,
              backButtonDispatcher: RootBackButtonDispatcher(),
              debugShowCheckedModeBanner: true,
              title: title,
              themeMode: AppConst.shared.themeMode,
              theme: AppConst.shared.appScheme.appSupplier.appTheme.lightTheme,
              darkTheme: AppConst.shared.appScheme.appSupplier.appTheme.darkTheme,
              // initialRoute: SearchFlightPage.route,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              builder: EasyLoading.init());
        }));
  }
}
