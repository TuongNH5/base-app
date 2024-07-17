import 'package:baseapp/router/my_router.dart';
import 'package:flutter/material.dart';
import 'package:myutils/base/page/wrapped_app.dart';
import 'package:myutils/constants/app_const.dart';
import 'package:myutils/data/configuration/gtd_app_config.dart';

void main() {
  final wrappedApp = WrappedApp.shared;
  AppConst.shared.themeMode = ThemeMode.light;
  // await Firebase.initializeApp(options: Platform.isAndroid ?  DefaultFirebaseOptions.android : DefaultFirebaseOptions.ios);
  final app = wrappedApp.createWrappedApp(
    router,
    "Gotadi b2c",
    appScheme: MyAppScheme.uatB2C,
  );

  runApp(app);
  // runApp(const MyApp());
}
