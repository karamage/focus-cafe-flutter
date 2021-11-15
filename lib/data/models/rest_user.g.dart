// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestUser _$_$_RestUserFromJson(Map<String, dynamic> json) {
  return _$_RestUser(
    id: json['id'] as String?,
    updateType:
        _$enumDecodeNullable(_$RealtimeUpdateTypeEnumMap, json['updateType']),
    startDate: json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    restTime: json['restTime'] as int? ?? 300,
    remainingTime: json['remainingTime'] as int?,
    chairId: json['chairId'] as int?,
    isOnline: json['isOnline'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_RestUserToJson(_$_RestUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'updateType': _$RealtimeUpdateTypeEnumMap[instance.updateType],
      'startDate': instance.startDate?.toIso8601String(),
      'user': instance.user,
      'restTime': instance.restTime,
      'remainingTime': instance.remainingTime,
      'chairId': instance.chairId,
      'isOnline': instance.isOnline,
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
