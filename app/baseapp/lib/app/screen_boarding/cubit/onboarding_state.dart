import 'package:equatable/equatable.dart';
import 'package:myutils/data/network/model/output/on_boarding_output.dart';


class OnboardingState extends Equatable {
  OnBoardingOutput? onBoardingOutput;
  int currentIndex;

  @override
  List<Object?> get props => [onBoardingOutput, currentIndex];

//<editor-fold desc="Data Methods">

  OnboardingState({
    this.onBoardingOutput,
    this.currentIndex = 0,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OnboardingState &&
          runtimeType == other.runtimeType &&
          onBoardingOutput == other.onBoardingOutput &&
          currentIndex == other.currentIndex);

  @override
  int get hashCode => onBoardingOutput.hashCode ^ currentIndex.hashCode;

  @override
  String toString() {
    return 'OnboardingState{' + ' onBoardingOutput: $onBoardingOutput,' + ' currentIndex: $currentIndex,' + '}';
  }

  OnboardingState copyWith({
    OnBoardingOutput? onBoardingOutput,
    int? currentIndex,
  }) {
    return OnboardingState(
      onBoardingOutput: onBoardingOutput ?? this.onBoardingOutput,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'onBoardingOutput': this.onBoardingOutput,
      'currentIndex': this.currentIndex,
    };
  }

  factory OnboardingState.fromMap(Map<String, dynamic> map) {
    return OnboardingState(
      onBoardingOutput: map['onBoardingOutput'] as OnBoardingOutput,
      currentIndex: map['currentIndex'] as int,
    );
  }

//</editor-fold>
}
