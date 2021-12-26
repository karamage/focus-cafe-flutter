import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_cafe_flutter/data/converter/datetime_converter.dart';
import 'package:json_annotation/json_annotation.dart';

class DatetimeListConverter implements JsonConverter<List<DateTime>?, List<dynamic>?> {
  const DatetimeListConverter();

  @override
  List<DateTime>? fromJson(List<dynamic>? json) => json?.map((d) => (d as JsonTimestamp).toDate()).toList();

  @override
  List<dynamic>? toJson(List<DateTime>? object) =>
      object == null ? null : object.map((o) => Timestamp.fromDate(o)).toList();
}
