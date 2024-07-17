// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:myutils/constants/app_fonts.dart';
import 'package:myutils/data/configuration/color_config/app_color.dart';
import 'package:myutils/data/configuration/color_config/color_status.dart';
import 'package:myutils/data/configuration/color_config/colors_extension.dart';

import 'gtd_app_config.dart';

abstract class GtdThemeData {
  static ThemeData get vibLightTheme => ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade50,
        fontFamily: AppFonts.fontInter,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
        }),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color.fromRGBO(18, 24, 38, 1),
          ),
          iconTheme: IconThemeData(
            color: Color.fromRGBO(18, 24, 38, 1),
          ),
          elevation: 0,
          color: Colors.transparent,
          scrolledUnderElevation: 0,
        ),
        colorScheme: _colorScheme(GtdAppSupplier.vib, ThemeMode.light),
        useMaterial3: true,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(38.0),
            ),
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: CustomColors.dividerColor,
          thickness: 1,
          space: 0,
        ),
        dividerColor: CustomColors.dividerColor,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        indicatorColor: AppColors.mainColor,
        progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.mainColor),
        primaryColor: const Color(0xFFF47920),
        textTheme: TextTheme(
          headlineLarge: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          headlineMedium: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          headlineSmall: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey.shade500),
        ),
        cardTheme: CardTheme(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            shadowColor: Colors.black26,
            surfaceTintColor: Colors.white),
        // RefreshIndicator
      ).copyWith(
        extensions: <ThemeExtension<dynamic>>[
          _colorStatus(GtdAppSupplier.vib, ThemeMode.light),
          _colorBackgroundStatus(GtdAppSupplier.vib, ThemeMode.light),
          const GtdAppGradientColor(
            startColor: Color(0xFFFE9B25),
            endColor: Color(0xFFFF5922),
          ),
        ],
      );

  static ThemeData get vibdarkTheme => ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade50,
        fontFamily: AppFonts.fontInter,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
        }),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color.fromRGBO(18, 24, 38, 1),
          ),
          iconTheme: IconThemeData(
            color: Color.fromRGBO(18, 24, 38, 1),
          ),
          elevation: 0,
          color: Colors.transparent,
          scrolledUnderElevation: 0,
        ),
        colorScheme: _colorScheme(GtdAppSupplier.vib, ThemeMode.dark),
        useMaterial3: true,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(38.0),
            ),
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: CustomColors.dividerColor,
          thickness: 1,
          space: 0,
        ),
        dividerColor: CustomColors.dividerColor,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        indicatorColor: AppColors.mainColor,
        progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.mainColor),
        primaryColor: const Color(0xFF0F5BDF),
        textTheme: TextTheme(
          headlineLarge: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          headlineMedium: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          headlineSmall: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey.shade500),
        ),
        cardTheme: CardTheme(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            shadowColor: Colors.black26,
            surfaceTintColor: Colors.white),
        // RefreshIndicator
      ).copyWith(
        extensions: <ThemeExtension<dynamic>>[
          _colorStatus(GtdAppSupplier.vib, ThemeMode.dark),
          _colorBackgroundStatus(GtdAppSupplier.vib, ThemeMode.dark),
          const GtdAppGradientColor(
            startColor: Color(0xFF007FFF),
            endColor: Color(0xFF134DD3),
          ),
        ],
      );

  static ThemeData get gotadiB2CLightTheme => ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade50,
        fontFamily: AppFonts.fontInter,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
        }),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color.fromRGBO(18, 24, 38, 1),
          ),
          iconTheme: IconThemeData(
            color: Color.fromRGBO(18, 24, 38, 1),
          ),
          color: Colors.transparent,
          // backgroundColor: Colors.transparent,
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          scrolledUnderElevation: 0,
        ),
        colorScheme: _colorScheme(GtdAppSupplier.b2c, ThemeMode.light),
        useMaterial3: true,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(38.0),
            ),
          ),
        ),
        dividerTheme: const DividerThemeData(
          color: CustomColors.dividerColor,
          thickness: 1,
          space: 0,
        ),
        dividerColor: CustomColors.dividerColor,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        indicatorColor: CustomColors.mainGreen,
        progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.mainColor),
        primaryColor: CustomColors.mainGreen,
        textTheme: TextTheme(
          headlineLarge: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          headlineMedium: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          headlineSmall: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey.shade500),
        ),
        cardTheme: CardTheme(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            shadowColor: Colors.black26,
            surfaceTintColor: Colors.white),
        // RefreshIndicator
      ).copyWith(
        extensions: <ThemeExtension<dynamic>>[
          _colorStatus(GtdAppSupplier.b2c, ThemeMode.light),
          _colorBackgroundStatus(GtdAppSupplier.b2c, ThemeMode.light),
          const GtdAppGradientColor(
            startColor: CustomColors.mainGreen,
            endColor: CustomColors.mainGreen,
          ),
        ],
      );

  static ColorScheme _colorScheme(GtdAppSupplier appSupplier, ThemeMode themeMode) {
    return ColorScheme(
      primary: CustomColors.mainAppColor(supplier: appSupplier, themeMode: themeMode),
      background: const Color(0xFFF5F5F5),
      brightness: Brightness.light,
      error: CustomColors.mainRed,
      onBackground: const Color(0xFFF5F5F5),
      onError: CustomColors.mainRed,
      onPrimary: CustomColors.mainAppColor(supplier: appSupplier, themeMode: themeMode),
      onSecondary: CustomColors.mainAppColor(supplier: appSupplier, themeMode: themeMode),
      onSurface: Colors.grey.shade900,
      secondary: CustomColors.mainAppColor(supplier: appSupplier, themeMode: themeMode),
      surface: Colors.grey.shade300,
      tertiary: CustomColors.lightMainAppColor(supplier: appSupplier, themeMode: themeMode),
    );
  }

  static GtdColorStatus _colorStatus(GtdAppSupplier appSupplier, ThemeMode themeMode) {
    if (appSupplier == GtdAppSupplier.vib) {
      return GtdColorStatus(
        success: CustomColors.mainAppColor(supplier: appSupplier, themeMode: themeMode),
        pending: Colors.grey.shade900,
        expired: Colors.grey.shade400,
        paymentFailed: Colors.grey.shade400,
        failed: Colors.grey.shade400,
        paymentRefunded: Colors.grey.shade400,
        cancelled: Colors.grey.shade400,
        booked: Colors.grey.shade900,
        tickedOnProcess: Colors.grey.shade900,
        paymentSuccessCommitFailed: Colors.grey.shade400,
        bookingAccepted: CustomColors.mainAppColor(supplier: appSupplier, themeMode: themeMode),
        bookingProcessed: Colors.grey.shade900,
        bookingPaylater: Colors.grey.shade900,
      );
    } else {
      return GtdColorStatus(
        success: CustomColors.mainAppColor(supplier: appSupplier, themeMode: themeMode),
        pending: Colors.orange.shade300,
        expired: Colors.grey.shade400,
        paymentFailed: Colors.red,
        failed: Colors.red,
        paymentRefunded: Colors.grey.shade400,
        cancelled: Colors.grey.shade400,
        booked: Colors.blue,
        tickedOnProcess: Colors.orange.shade300,
        paymentSuccessCommitFailed: Colors.grey.shade400,
        bookingAccepted: CustomColors.mainAppColor(supplier: appSupplier, themeMode: themeMode),
        bookingProcessed: Colors.grey.shade900,
        bookingPaylater: Colors.grey.shade900,
      );
    }
  }

  static GtdColorBackgroundStatus _colorBackgroundStatus(GtdAppSupplier appSupplier, ThemeMode themeMode) {
    if (appSupplier == GtdAppSupplier.vib) {
      return GtdColorBackgroundStatus(
        success: CustomColors.lightMainAppColor(supplier: appSupplier, themeMode: themeMode),
        pending: Colors.grey.shade100,
        expired: Colors.grey.shade100,
        paymentFailed: Colors.grey.shade100,
        failed: Colors.grey.shade100,
        paymentRefunded: Colors.grey.shade100,
        cancelled: Colors.grey.shade100,
        booked: Colors.grey.shade100,
        tickedOnProcess: Colors.grey.shade100,
        paymentSuccessCommitFailed: Colors.grey.shade100,
        bookingAccepted: CustomColors.mainAppColor(supplier: appSupplier, themeMode: themeMode),
        bookingProcessed: Colors.grey.shade100,
        bookingPaylater: Colors.grey.shade100,
      );
    } else {
      return GtdColorBackgroundStatus(
        success: CustomColors.lightMainAppColor(supplier: appSupplier, themeMode: themeMode),
        pending: Colors.orange.shade50,
        expired: Colors.grey.shade100,
        paymentFailed: Colors.red.shade50,
        failed: Colors.red.shade50,
        paymentRefunded: Colors.grey.shade100,
        cancelled: Colors.grey.shade100,
        booked: Colors.blue.shade50,
        tickedOnProcess: Colors.orange.shade50,
        paymentSuccessCommitFailed: Colors.grey.shade100,
        bookingAccepted: CustomColors.mainAppColor(supplier: appSupplier, themeMode: themeMode),
        bookingProcessed: Colors.grey.shade100,
        bookingPaylater: Colors.grey.shade100,
      );
    }
  }
}
