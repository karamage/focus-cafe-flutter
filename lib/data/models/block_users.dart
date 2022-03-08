import 'package:focus_cafe_flutter/data/models/block_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'block_users.freezed.dart';
part 'block_users.g.dart';

@freezed
abstract class BlockUsers with _$BlockUsers{
  const factory BlockUsers({
    @Default([]) List<BlockUser> items,
    @Default(true) bool isLoading,
  }) = _BlockUsers;
  factory BlockUsers.fromJson(Map<String, dynamic> json) => _$BlockUsersFromJson(json);
}
