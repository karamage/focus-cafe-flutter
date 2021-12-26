import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_cafe_flutter/data/converter/datetime_converter.dart';
import 'package:focus_cafe_flutter/data/converter/datetime_list_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
abstract class Activity with _$Activity{
  const factory Activity({
    String? id,
    @DatetimeListConverter() List<DateTime>? dates,
    int? continuedDateNum,
  }) = _Activity;
  factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);

  // Activity作成の際のパラメータ
  static Map<String, dynamic> createActivityParams(String id, List<DateTime> dates) {
    Map<String, dynamic> map = Map();
    map["id"] = id;
    map["dates"] = dates;
    return map;
  }
}
