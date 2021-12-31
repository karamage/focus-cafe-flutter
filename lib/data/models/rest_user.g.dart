// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestUser _$_$_RestUserFromJson(Map<String, dynamic> json) {
  return _$_RestUser(
    id: json['id'] as String?,
    startDate:
        const DatetimeConverter().fromJson(json['startDate'] as JsonTimestamp?),
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    chairId: json['chairId'] as int?,
    isOnline: json['isOnline'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_RestUserToJson(_$_RestUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': const DatetimeConverter().toJson(instance.startDate),
      'user': instance.user,
      'chairId': instance.chairId,
      'isOnline': instance.isOnline,
    };
