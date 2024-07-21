import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:myutils/base/bloc/widget_cubit.dart';
import 'package:myutils/configofmypt/config/injection.dart';
import 'package:myutils/data/network/model/output/on_boarding_output.dart';

import 'onboarding_state.dart';
import 'package:myutils/data/repositories/news_events_repository.dart';


class OnboardingCubit extends WidgetCubit<OnboardingState> {
  late PageController controller;

  final NewsEventsRepository _newsEventsRepository = injector();

  OnboardingCubit() : super(widgetState: OnboardingState()) {
    controller = PageController();
  }

  // Added
  @override
  Future<void> close() async {
    controller.dispose();
    return super.close();
  }

  callApiOnboarding() async {
    try {
      final onBoarding = await fetchApi(_newsEventsRepository.getOnboarding);
      if (kDebugMode) {
        print('onBoarding ${onBoarding.data?.length ?? 0}');
      }

    } catch (e) {

    }
  }

  @override
  void onWidgetCreated() {
    // callApiOnboarding();
  }

  onNext() {
    controller.nextPage(
      duration: const Duration(milliseconds: 100),
      curve: Curves.bounceIn,
    );
  }

  onSkip() {
    final listData = state.onBoardingOutput?.data ?? [];
    controller.jumpToPage(listData.length - 1);
  }

  onPageChangeCurrent(int index) {
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 100),
      curve: Curves.bounceIn,
    );
  }


}
