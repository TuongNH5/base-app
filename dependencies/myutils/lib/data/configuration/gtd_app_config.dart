import 'package:flutter/material.dart';
import 'package:myutils/data/configuration/gtd_app_theme.dart';

enum MyAppScheme {
  uatvib('env.uat', GtdAppSupplier.vib, GtdPackageResoure.vib, false),
  prodvib('env.prod', GtdAppSupplier.vib, GtdPackageResoure.vib, false),
  prodB2C('env.prod', GtdAppSupplier.b2c, GtdPackageResoure.gotadiB2C, true),
  uatB2C('env.uat', GtdAppSupplier.b2c, GtdPackageResoure.gotadiB2C, true),
  prodB2B('env.prod', GtdAppSupplier.agent, GtdPackageResoure.gotadiB2B, true),
  uatB2B('env.uat', GtdAppSupplier.agent, GtdPackageResoure.gotadiB2B, true);

  final String envFile;
  final GtdAppSupplier appSupplier;
  final GtdPackageResoure packageResoure;
  final bool hasPayment;
  const MyAppScheme(this.envFile, this.appSupplier, this.packageResoure, this.hasPayment);

  static MyAppScheme getAppScheme(String env, String partner) {
    switch (partner) {
      case "vib":
        return (env == "prod") ? MyAppScheme.prodvib : MyAppScheme.uatvib;
      case "b2c":
        return (env == "prod") ? MyAppScheme.prodB2C : MyAppScheme.uatB2C;
      default:
        return (env == "prod") ? MyAppScheme.prodB2C : MyAppScheme.uatB2C;
    }
  }
}

enum GtdAppSupplier {
  b2c(GtdAppTheme.gotadiB2C),
  agent(GtdAppTheme.gotadiAgent),
  ca(GtdAppTheme.gotadiAgent),
  vib(GtdAppTheme.vib);

  final GtdAppTheme appTheme;
  const GtdAppSupplier(this.appTheme);
}

enum GtdAppTheme {
  gotadiB2C,
  gotadiAgent,
  vib;

  const GtdAppTheme();
}

extension GtdAppThemeData on GtdAppTheme {
  ThemeData get lightTheme {
    switch (this) {
      case GtdAppTheme.gotadiB2C:
        return GtdThemeData.gotadiB2CLightTheme;
      case GtdAppTheme.gotadiAgent:
        return GtdThemeData.gotadiB2CLightTheme;
      case GtdAppTheme.vib:
        return GtdThemeData.vibLightTheme;
      default:
        return GtdThemeData.vibLightTheme;
    }
  }

  ThemeData get darkTheme {
    switch (this) {
      case GtdAppTheme.gotadiB2C:
        return GtdThemeData.gotadiB2CLightTheme;
      case GtdAppTheme.gotadiAgent:
        return GtdThemeData.gotadiB2CLightTheme;
      case GtdAppTheme.vib:
        return GtdThemeData.vibdarkTheme;
      default:
        return GtdThemeData.vibdarkTheme;
    }
  }
}

// Define Resource Asset Package Name here
enum GtdPackageResoure {
  common('common_resource'),
  gotadiB2C('gotadi_resource'),
  gotadiB2B('gotadi_resource'),
  vib('vib_resource');

  final String resource;
  const GtdPackageResoure(this.resource);
}
