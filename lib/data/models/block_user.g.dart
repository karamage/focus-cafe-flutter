// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BlockUser _$_$_BlockUserFromJson(Map<String, dynamic> json) {
  return _$_BlockUser(
    id: json['id'] as String?,
    name: json['name'] as String? ?? '',
    photoUrl: json['photoUrl'] as String? ?? '',
    createdAt:
        const DatetimeConverter().fromJson(json['createdAt'] as JsonTimestamp?),
  );
}

Map<String, dynamic> _$_$_BlockUserToJson(_$_BlockUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'createdAt': const DatetimeConverter().toJson(instance.createdAt),
    };
