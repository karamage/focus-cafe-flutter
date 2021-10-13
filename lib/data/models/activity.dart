import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
abstract class Activity with _$Activity{
  const factory Activity({
    @Default([]) List<DateTime> dates,
    @Default(0) int continuedDateNum,
  }) = _Activity;
  factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);
}
