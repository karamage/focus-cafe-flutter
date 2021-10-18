// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestUser _$_$_RestUserFromJson(Map<String, dynamic> json) {
  return _$_RestUser(
    id: json['id'] as String?,
    startDate: json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
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
      'startDate': instance.startDate?.toIso8601String(),
      'user': instance.user,
      'chairId': instance.chairId,
      'isOnline': instance.isOnline,
    };
