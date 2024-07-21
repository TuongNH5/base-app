import 'package:baseapp/app/main/home_screen.dart';
import 'package:baseapp/app/screen_boarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:myutils/helpers/extension/colors_extension.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Future.delayed(const Duration(seconds: 2)).then((value) {
    //   context.pushReplacement(HomeScreen.route);
    // });
    return OnBoardingScreen();
    return ColoredBox(
      color: MyColors.blueGrey,
      child: SizedBox(
        height: size.height,
        width: size.width,
      ),
    );
  }
}
