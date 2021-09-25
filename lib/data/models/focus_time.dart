import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'focus_time.freezed.dart';

@freezed
abstract class FocusTime with _$FocusTime{
  const factory FocusTime({
    @Default(0) int remainingTime,
    Timer? timer
  }) = _FocusTime;
}
