// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notification _$_$_NotificationFromJson(Map<String, dynamic> json) {
  return _$_Notification(
    id: json['id'] as String? ?? '',
    createdAt:
        const DatetimeConverter().fromJson(json['createdAt'] as Timestamp?),
    isReaded: json['isReaded'] as bool? ?? false,
    toUser: json['toUser'] == null
        ? null
        : User.fromJson(json['toUser'] as Map<String, dynamic>),
    fromUser: json['fromUser'] == null
        ? null
        : User.fromJson(json['fromUser'] as Map<String, dynamic>),
    body: json['body'] as String? ?? '',
    notificationType: _$enumDecodeNullable(
            _$NotificationTypeEnumMap, json['notificationType']) ??
        NotificationType.like,
    doneId: json['doneId'] as String?,
  );
}

Map<String, dynamic> _$_$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': const DatetimeConverter().toJson(instance.createdAt),
      'isReaded': instance.isReaded,
      'toUser': instance.toUser,
      'fromUser': instance.fromUser,
      'body': instance.body,
      'notificationType': _$NotificationTypeEnumMap[instance.notificationType],
      'doneId': instance.doneId,
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

const _$NotificationTypeEnumMap = {
  NotificationType.like: 'like',
  NotificationType.comment: 'comment',
  NotificationType.system: 'system',
};
