// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Activity _$_$_ActivityFromJson(Map<String, dynamic> json) {
  return _$_Activity(
    id: json['id'] as String?,
    dates: const DatetimeListConverter()
        .fromJson((json['dates'] as List).map((d) => d as JsonTimestamp).toList()),
    continuedDateNum: json['continuedDateNum'] as int?,
  );
}

Map<String, dynamic> _$_$_ActivityToJson(_$_Activity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dates': const DatetimeListConverter().toJson(instance.dates),
      'continuedDateNum': instance.continuedDateNum,
    };
