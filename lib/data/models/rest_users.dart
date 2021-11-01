import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_users.freezed.dart';
part 'rest_users.g.dart';

@freezed
abstract class RestUsers with _$RestUsers{
  const factory RestUsers({
    @Default([]) List<RestUser> items,
    @Default(true) bool isLoading,
  }) = _RestUsers;
  factory RestUsers.fromJson(Map<String, dynamic> json) => _$RestUsersFromJson(json);
}
