// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BlockUsers _$_$_BlockUsersFromJson(Map<String, dynamic> json) {
  return _$_BlockUsers(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => BlockUser.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    isLoading: json['isLoading'] as bool? ?? true,
  );
}

Map<String, dynamic> _$_$_BlockUsersToJson(_$_BlockUsers instance) =>
    <String, dynamic>{
      'items': instance.items,
      'isLoading': instance.isLoading,
    };
