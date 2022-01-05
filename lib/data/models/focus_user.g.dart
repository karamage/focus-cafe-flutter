// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FocusUser _$_$_FocusUserFromJson(Map<String, dynamic> json) {
  return _$_FocusUser(
    id: json['id'] as String?,
    startDate:
        const DatetimeConverter().fromJson(json['startDate'] as JsonTimestamp?),
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    focusTime: json['focusTime'] as int? ?? 1500,
    remainingTime: json['remainingTime'] as int?,
    isOnline: json['isOnline'] as bool? ?? false,
    todayCount: json['todayCount'] as int?,
    isQuest: json['isQuest'] as bool? ?? false,
    isPublicQuest: json['isPublicQuest'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_FocusUserToJson(_$_FocusUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': const DatetimeConverter().toJson(instance.startDate),
      'user': instance.user,
      'focusTime': instance.focusTime,
      'remainingTime': instance.remainingTime,
      'isOnline': instance.isOnline,
      'todayCount': instance.todayCount,
      'isQuest': instance.isQuest,
      'isPublicQuest': instance.isPublicQuest,
    };
