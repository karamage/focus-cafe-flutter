import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_time.freezed.dart';

@freezed
abstract class RestTime with _$RestTime{
  const factory RestTime({
    @Default(0) int remainingTime,
    Timer? timer
  }) = _RestTime;
}
