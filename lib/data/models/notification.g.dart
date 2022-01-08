// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notification _$_$_NotificationFromJson(Map<String, dynamic> json) {
  return _$_Notification(
    id: json['id'] as String?,
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
    notificationType: json['notificationType'] as String? ?? '',
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
      'notificationType': instance.notificationType,
      'doneId': instance.doneId,
    };
