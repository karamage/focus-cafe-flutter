// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FocusUsers _$_$_FocusUsersFromJson(Map<String, dynamic> json) {
  return _$_FocusUsers(
    items: (json['items'] as List<dynamic>?)
            ?.map((e) => FocusUser.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    isLoading: json['isLoading'] as bool? ?? true,
  );
}

Map<String, dynamic> _$_$_FocusUsersToJson(_$_FocusUsers instance) =>
    <String, dynamic>{
      'items': instance.items,
      'isLoading': instance.isLoading,
    };
