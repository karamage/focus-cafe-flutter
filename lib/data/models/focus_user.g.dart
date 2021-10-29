// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FocusUser _$_$_FocusUserFromJson(Map<String, dynamic> json) {
  return _$_FocusUser(
    id: json['id'] as String?,
    updateType:
        _$enumDecodeNullable(_$RealtimeUpdateTypeEnumMap, json['updateType']),
    startDate: json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    focusTime: json['focusTime'] as int?,
    isOnline: json['isOnline'] as bool? ?? false,
    todayCount: json['todayCount'] as int?,
    isQuest: json['isQuest'] as bool? ?? false,
    isPublicQuest: json['isPublicQuest'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_FocusUserToJson(_$_FocusUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'updateType': _$RealtimeUpdateTypeEnumMap[instance.updateType],
      'startDate': instance.startDate?.toIso8601String(),
      'user': instance.user,
      'focusTime': instance.focusTime,
      'isOnline': instance.isOnline,
      'todayCount': instance.todayCount,
      'isQuest': instance.isQuest,
      'isPublicQuest': instance.isPublicQuest,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$RealtimeUpdateTypeEnumMap = {
  RealtimeUpdateType.added: 'added',
  RealtimeUpdateType.modified: 'modified',
  RealtimeUpdateType.removed: 'removed',
};
