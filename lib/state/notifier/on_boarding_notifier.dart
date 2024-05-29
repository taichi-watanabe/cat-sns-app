import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'on_boarding_notifier.freezed.dart';
part 'on_boarding_notifier.g.dart';

@riverpod
class OnBoardingNotifier extends _$OnBoardingNotifier {
  @override
  OnBoardingState build() {
    return OnBoardingState.empty();
  }

  void pageHandling(int pageLength, {required VoidCallback completePage}) {
    if (pageLength - 1 == state.pageIndex) return completePage();

    state.pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    updatePageState(state.pageIndex + 1);
  }

  void updatePageState(int index) => state = state.copyWith(pageIndex: index);
}

@freezed
class OnBoardingState with _$OnBoardingState {
  factory OnBoardingState({
    @Default(0) int pageIndex,
    required PageController pageController,
  }) = _OnBoardingState;
  OnBoardingState._();

  factory OnBoardingState.empty() {
    return OnBoardingState(pageController: PageController());
  }
}
