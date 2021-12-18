import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

typedef JsonTimestamp = Timestamp;

class DatetimeConverter implements JsonConverter<DateTime?, JsonTimestamp?> {
  const DatetimeConverter();

  @override
  DateTime? fromJson(JsonTimestamp? json) => json?.toDate();

  @override
  JsonTimestamp? toJson(DateTime? object) =>
      object == null ? null : Timestamp.fromDate(object) as JsonTimestamp;
}