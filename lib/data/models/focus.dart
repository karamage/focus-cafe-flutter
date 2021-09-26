import 'package:focus_cafe_flutter/util/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'focus.freezed.dart';

@freezed
abstract class Focus with _$Focus{
  const factory Focus({
    @Default(false) bool isFocus,
    @Default(INIT_FOCUS_TIME_SEC) int focusTime,
    @Default(null) DateTime? startDate,
    @Default(false) bool isRest,
  }) = _Focus;
}
