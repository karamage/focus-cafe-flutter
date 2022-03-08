import 'package:focus_cafe_flutter/data/converter/datetime_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'block_user.freezed.dart';
part 'block_user.g.dart';

@freezed
abstract class BlockUser with _$BlockUser {
  const factory BlockUser({
    String? id,
    @Default("") String name,
    @Default("") String photoUrl,
    @DatetimeConverter() DateTime? createdAt,
  }) = _BlockUser;

  factory BlockUser.fromJson(Map<String, dynamic> json) =>
      _$BlockUserFromJson(json);

  static BlockUser createBlockUserParams(
      String id,
      String name,
      String photoUrl,
      ) {
    return new BlockUser(
      id: id,
      name: name,
      photoUrl: photoUrl,
    );
  }
}