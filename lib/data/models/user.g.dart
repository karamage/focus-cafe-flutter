// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as String?,
    name: json['name'] as String? ?? '',
    desc: json['desc'] as String? ?? '',
    photoUrl: json['photoUrl'] as String? ?? '',
    totalPoint: json['totalPoint'] as int? ?? 0,
    isAnonymous: json['isAnonymous'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'photoUrl': instance.photoUrl,
      'totalPoint': instance.totalPoint,
      'isAnonymous': instance.isAnonymous,
    };
