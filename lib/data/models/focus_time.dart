import 'package:freezed_annotation/freezed_annotation.dart';

part 'focus_time.freezed.dart';
part 'focus_time.g.dart';

@freezed
abstract class FocusTime with _$FocusTime{
  const factory FocusTime({
    @Default(0) int remainingTime
  }) = _FocusTime;
  factory FocusTime.fromJson(Map<String, dynamic> json) => _$FocusTimeFromJson(json);
}
