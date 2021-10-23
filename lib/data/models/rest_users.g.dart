// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestUsers _$_$_RestUsersFromJson(Map<String, dynamic> json) {
  return _$_RestUsers(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => RestUser.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    isLoading: json['isLoading'] as bool? ?? true,
  );
}

Map<String, dynamic> _$_$_RestUsersToJson(_$_RestUsers instance) =>
    <String, dynamic>{
      'items': instance.items,
      'isLoading': instance.isLoading,
    };
