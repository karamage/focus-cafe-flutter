import 'dart:async';

import 'package:focus_cafe_flutter/data/models/rest_time.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RestTimeNotifier extends StateNotifier<RestTime> {
  RestTimeNotifier() : super(const RestTime(remainingTime: 0)) {}

  Future<void> setRemainingTime(int remainingTime) async {
    state = state.copyWith(remainingTime: remainingTime);
  }

  Future<void> setTimer(Timer? timer) async {
    state = state.copyWith(timer: timer);
  }

  bool isRest() => state.timer != null;
}
