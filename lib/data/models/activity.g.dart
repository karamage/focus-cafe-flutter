// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Activity _$_$_ActivityFromJson(Map<String, dynamic> json) {
  return _$_Activity(
    id: json['id'] as String?,
    dates: (json['dates'] as List<dynamic>?)
            ?.map((e) => DateTime.parse(e as String))
            .toList() ??
        [],
    continuedDateNum: json['continuedDateNum'] as int?,
  );
}

Map<String, dynamic> _$_$_ActivityToJson(_$_Activity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dates': instance.dates.map((e) => e.toIso8601String()).toList(),
      'continuedDateNum': instance.continuedDateNum,
    };
