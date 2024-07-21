import 'package:baseapp/app/screen_boarding/cubit/onboarding_cubit.dart';
import 'package:baseapp/app/screen_boarding/cubit/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myutils/helpers/extension/colors_extension.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit()..callApiOnboarding(),
      child: _UIOnBoardingScreen(),
    );
  }
}

class _UIOnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final listData = state.onBoardingOutput?.data ?? [];
        return WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();
            return false;
          },
          child: Scaffold(
            backgroundColor: MyColors.blue,
            body: listData.isNotEmpty ? ListView.builder(
              itemCount: listData.length,
              itemBuilder: (context, index) {
                final item = listData[index];
                return Container(
                  width: sizeWidth,
                  height: sizeHeight,
                  child: Image.network(
                    item.img ?? '',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ) : const SizedBox(),
          ),
        );
      },
    );
  }
}
