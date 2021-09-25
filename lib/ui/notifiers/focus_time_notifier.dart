import 'dart:async';

import 'package:focus_cafe_flutter/data/models/focus_time.dart';
import 'package:focus_cafe_flutter/util/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FocusTimeNotifier extends StateNotifier<FocusTime> {
  FocusTimeNotifier() : super(const FocusTime(remainingTime: 0)) {}

  Future<void> setRemainingTime(int remainingTime) async {
    state = state.copyWith(remainingTime: remainingTime);
  }

  Future<void> setTimer(Timer? timer) async {
    state = state.copyWith(timer: timer);
  }

  void startTimer(void Function(Timer) onTimer) {
    final timer = Timer.periodic(const Duration(seconds: 1), onTimer);
    setTimer(timer);
  }

  void stopTimer() {
    state.timer?.cancel();
    setTimer(null);
    setRemainingTime(INIT_FOCUS_TIME_SEC);
  }

  bool isFocus() => state.timer != null;
}
