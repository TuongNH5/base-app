import 'package:flutter/material.dart';
import 'package:myutils/data/configuration/gtd_app_config.dart';

/// App name and info constants.
class AppConst {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppConst._();

  static final shared = AppConst._();

  /// Name of the app.
  static const String appName = 'Gotadi';

  /// Current app version.
  static const String version = '0.1.2';

  /// Used version of FlexColorScheme package.
  static const String packageVersion = '6.1.0';

  /// Build with Flutter version.
  static const String flutterVersion = 'Channel stable v3.7.0';

  /// Copyright years notice.
  static const String copyright = '© 2022, 2023';

  /// Author info.
  static const String author = 'TamKieu';

  /// License info.
  static const String license = 'BSD 3-Clause License';

  /// AppScheme
  late final MyAppScheme appScheme;

  /// AppThemeMode
  ThemeMode? themeMode;

  ThemeData get currentThemeData => (themeMode == ThemeMode.dark)
      ? appScheme.appSupplier.appTheme.darkTheme
      : appScheme.appSupplier.appTheme.lightTheme;

  /// Link to the FlexColorScheme package.
  static final Uri packageUri = Uri(
    scheme: 'https',
    host: 'pub.dev',
    path: 'packages/flex_color_scheme',
  );

  /// AppAssetPackage
  String get supplierResource {
    return appScheme.packageResoure.resource;
  }

  /// AppAssetPackageCommon
  String get commonResource {
    return GtdPackageResoure.common.resource;
  }
}
