import 'package:freezed_annotation/freezed_annotation.dart';

part 'block_user.freezed.dart';
part 'block_user.g.dart';

@freezed
abstract class BlockUser with _$BlockUser {
  const factory BlockUser({
    String? id,
    @Default("") String name,
    @Default("") String photoUrl,
  }) = _BlockUser;

  factory BlockUser.fromJson(Map<String, dynamic> json) =>
      _$BlockUserFromJson(json);
}