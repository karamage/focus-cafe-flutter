import 'package:focus_cafe_flutter/data/models/focus_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'focus_users.freezed.dart';
part 'focus_users.g.dart';

@freezed
abstract class FocusUsers with _$FocusUsers{
  const factory FocusUsers({
    @Default([]) List<FocusUser> items,
    @Default(true) bool isLoading,
  }) = _FocusUsers;
  factory FocusUsers.fromJson(Map<String, dynamic> json) => _$FocusUsersFromJson(json);
}
