/// Created by Nguyen Huu Tu on 28/03/2022.

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:myutils/base/bloc/local_cubit.dart';
import 'package:myutils/base/bloc/app_cubit.dart';
import 'package:myutils/base/bloc/app_state.dart';
import 'app_config.dart';
import 'injection.dart';

class DayOneApplication extends StatelessWidget {
  final GoRouter appRouter;
  DayOneApplication({super.key, required this.appRouter});
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    final appConfig = injector<AppConfig>();

    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => NotificationCubit(),
        //   lazy: false,
        // ),
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
            create: (context) => LocalCubit()
              // ..initCached()
              ..initSetting()),
        // BlocProvider(
        //   create: (context) => AuthExternalCubit(),
        // ),
      ],
      // child: Container(),
      child: BlocListener<AppCubit, AppState>(
        listenWhen: (previous, current) {
          return previous.connectivityResult != current.connectivityResult && previous.connectivityResult != null;
        },
        listener: (context, state) {
          if (state.connectivityResult == ConnectivityResult.none) {
            _scaffoldMessengerKey.currentState?.showSnackBar(
              SnackBar(
                  content: const Text('Bạn đang offline, vui lòng kiểm tra lại kết nối internet'),
                  duration: const Duration(seconds: 3),
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            );
          } else if (state.connectivityResult == ConnectivityResult.mobile ||
              state.connectivityResult == ConnectivityResult.wifi) {
            _scaffoldMessengerKey.currentState?.showSnackBar(
              SnackBar(
                  content: const Text('Kết nối internet đã được khôi phục'),
                  duration: const Duration(seconds: 3),
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            );
          }
        },
        child: EasyLocalization(
            supportedLocales: const [
              Locale.fromSubtags(languageCode: 'vi'),
              Locale.fromSubtags(languageCode: 'en'),
            ],
            // path: GtdString.pathForAsset(settingState.packageResource, 'assets/translations'),
            path: 'assets/translations',
            saveLocale: false,
            fallbackLocale: const Locale('vi'),
            useOnlyLangCode: true,
            // startLocale: settingState.locale,
            startLocale: const Locale('vi'),
            child: MyBaseApp(
              router: appRouter,
              title: 'DayOne',
            )),
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
    return MaterialApp.router(
        // routerConfig: router,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        backButtonDispatcher: RootBackButtonDispatcher(),
        debugShowCheckedModeBanner: true,
        title: title,
        // themeMode: AppConst.shared.themeMode,
        // theme: AppConst.shared.appScheme.appSupplier.appTheme.lightTheme,
        // darkTheme: AppConst.shared.appScheme.appSupplier.appTheme.darkTheme,
        // initialRoute: SearchFlightPage.route,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        builder: EasyLoading.init());

    // return MultiBlocProvider(
    //     providers: [
    //       BlocProvider(create: (context) => SettingCubit()),
    //     ],
    //     child: BlocBuilder<SettingCubit, ThemeData>(builder: (context, state) {
    //       return MaterialApp.router(
    //         // routerConfig: router,
    //           routeInformationParser: router.routeInformationParser,
    //           routeInformationProvider: router.routeInformationProvider,
    //           routerDelegate: router.routerDelegate,
    //           backButtonDispatcher: RootBackButtonDispatcher(),
    //           debugShowCheckedModeBanner: true,
    //           title: title,
    //           // themeMode: AppConst.shared.themeMode,
    //           // theme: AppConst.shared.appScheme.appSupplier.appTheme.lightTheme,
    //           // darkTheme: AppConst.shared.appScheme.appSupplier.appTheme.darkTheme,
    //           // initialRoute: SearchFlightPage.route,
    //           localizationsDelegates: context.localizationDelegates,
    //           supportedLocales: context.supportedLocales,
    //           locale: context.locale,
    //           builder: EasyLoading.init());
    //     }));
  }
}

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
      ));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
      ));
}
