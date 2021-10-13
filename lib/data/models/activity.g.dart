// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Activity _$_$_ActivityFromJson(Map<String, dynamic> json) {
  return _$_Activity(
    dates: (json['dates'] as List<dynamic>?)
            ?.map((e) => DateTime.parse(e as String))
            .toList() ??
        [],
    continuedDateNum: json['continuedDateNum'] as int? ?? 0,
  );
}

Map<String, dynamic> _$_$_ActivityToJson(_$_Activity instance) =>
    <String, dynamic>{
      'dates': instance.dates.map((e) => e.toIso8601String()).toList(),
      'continuedDateNum': instance.continuedDateNum,
    };
