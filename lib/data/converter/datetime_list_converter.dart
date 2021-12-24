import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_cafe_flutter/data/converter/datetime_converter.dart';
import 'package:json_annotation/json_annotation.dart';

class DatetimeListConverter implements JsonConverter<List<DateTime>?, List<JsonTimestamp>?> {
  const DatetimeListConverter();

  @override
  List<DateTime>? fromJson(List<JsonTimestamp>? json) => json?.map((d) => d.toDate()).toList();

  @override
  List<JsonTimestamp>? toJson(List<DateTime>? object) =>
      object == null ? null : object.map((o) => Timestamp.fromDate(o)).toList();
}
