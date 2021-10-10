import 'package:focus_cafe_flutter/data/models/focus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FocusNotifier extends StateNotifier<Focus> {
  FocusNotifier() : super(const Focus()) {}

  void setFocusTime(int focusTime) {
    state = state.copyWith(focusTime: focusTime);
  }

  void setIsFocus(bool isFocus) {
    state = state.copyWith(isFocus: isFocus);
  }

  void setStartDate(DateTime? startDate) {
    state = state.copyWith(startDate: startDate);
  }
}
