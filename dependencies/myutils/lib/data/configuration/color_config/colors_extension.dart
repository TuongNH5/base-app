import 'package:flutter/material.dart';
import 'package:myutils/data/configuration/gtd_app_config.dart';
import 'package:myutils/utils/gtd_widgets/gtd_tuple.dart';

extension CustomColors on Colors {
  static const MaterialColor mainGreen =
      MaterialColor(0xFF1AA260, <int, Color>{50: Color(0xFFE6F5EC), 100: Color(0xFFBAE3CF), 500: Color(0xFF1AA260)});
  static const MaterialColor mainOrange =
      MaterialColor(0xFFF47920, <int, Color>{50: Color(0xFFFFF2E9), 100: Color(0xFFfac9a5), 500: Color(0xFFF47920)});
  static Tuple<Color, Color> gradientOrange = Tuple(item1: const Color(0xFFFE9B25), item2: const Color(0xFFFF5922));
  static Tuple<Color, Color> gradientBlue = Tuple(item1: const Color(0xFF007FFF), item2: const Color(0xFF134DD3));
  static Tuple<Color, Color> gradientGreen = Tuple(item1: const Color(0xFF1AA260), item2: const Color(0XFF05C49F));
  static const MaterialColor mainRed =
      MaterialColor(0xFFDB0D0D, <int, Color>{50: Color(0xFFFFEBEB), 500: Color(0xFFDB0D0D)});
  static const MaterialColor mainBlue =
      MaterialColor(0xFF0F5BDF, <int, Color>{50: Color(0xFFe7ecfa), 100: Color(0xFF99cbff), 500: Color(0xFF0F5BDF)});
  static const MaterialColor darkBlue =
      MaterialColor(0xFF0F5BDF, <int, Color>{50: Color(0xFFe7ecfa), 100: Color(0xFF99cbff), 500: Color(0xFF0158A9)});
  static const MaterialColor borderColor =
      MaterialColor(0xFFE5E7EB, <int, Color>{50: Color(0xFFE5E7EB), 500: Color(0xFFE5E7EB)});

  static const Color dividerColor = Color(0xFFF9FAFB);

  static MaterialColor mainAppColor({required GtdAppSupplier supplier, ThemeMode themeMode = ThemeMode.system}) {
    switch (supplier) {
      case GtdAppSupplier.b2c:
        return CustomColors.mainGreen;
      case GtdAppSupplier.vib:
        return themeMode == ThemeMode.dark ? CustomColors.mainBlue : CustomColors.mainOrange;
      default:
        return CustomColors.mainGreen;
    }
  }

  static Color lightMainAppColor({required GtdAppSupplier supplier, ThemeMode themeMode = ThemeMode.system}) {
    switch (supplier) {
      case GtdAppSupplier.b2c:
        return CustomColors.mainGreen.shade50;
      case GtdAppSupplier.vib:
        return themeMode == ThemeMode.dark ? CustomColors.mainBlue.shade50 : CustomColors.mainOrange.shade50;
      default:
        return CustomColors.mainGreen.shade50;
    }
  }

  static Color mediumMainAppColor({required GtdAppSupplier supplier, ThemeMode themeMode = ThemeMode.system}) {
    switch (supplier) {
      case GtdAppSupplier.b2c:
        return CustomColors.mainGreen.shade100;
      case GtdAppSupplier.vib:
        return themeMode == ThemeMode.dark ? CustomColors.mainBlue.shade100 : CustomColors.mainOrange.shade100;
      default:
        return CustomColors.mainGreen.shade100;
    }
  }

  static Color headerAppColor({required GtdAppSupplier supplier, ThemeMode themeMode = ThemeMode.system}) {
    switch (supplier) {
      case GtdAppSupplier.b2c:
        return CustomColors.mainOrange;
      case GtdAppSupplier.vib:
        return themeMode == ThemeMode.dark ? CustomColors.mainBlue : CustomColors.mainOrange;
      default:
        return CustomColors.mainOrange;
    }
  }

  static Color lightHeaderAppColor({required GtdAppSupplier supplier, ThemeMode themeMode = ThemeMode.system}) {
    switch (supplier) {
      case GtdAppSupplier.b2c:
        return CustomColors.mainOrange.shade50;
      case GtdAppSupplier.vib:
        return themeMode == ThemeMode.dark ? CustomColors.mainBlue.shade50 : CustomColors.mainOrange.shade50;
      default:
        return CustomColors.mainOrange.shade50;
    }
  }

  static Tuple<Color, Color> gradientColors(
      {required GtdAppSupplier supplier, ThemeMode themeMode = ThemeMode.system}) {
    switch (supplier) {
      case GtdAppSupplier.b2c:
        return CustomColors.gradientGreen;
      case GtdAppSupplier.vib:
        return themeMode == ThemeMode.dark ? CustomColors.gradientBlue : CustomColors.gradientOrange;
      default:
        // return Tuple(item1: CustomColors.mainGreen, item2: CustomColors.mainGreen);
        return CustomColors.gradientGreen;
    }
  }
}
