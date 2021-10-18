import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_user.freezed.dart';
part 'rest_user.g.dart';

@freezed
abstract class RestUser with _$RestUser {
  const factory RestUser({
    String? id,
    DateTime? startDate,
    User? user,
    int? chairId,
    @Default(false) bool isOnline,
  }) = _RestUser;

  factory RestUser.fromJson(Map<String, dynamic> json) =>
      _$RestUserFromJson(json);

  // User作成の際のパラメータ
  static Map<String, dynamic> addRestUserParams(
    DateTime startDate,
    User user,
  ) {
    Map<String, dynamic> map = Map();
    map["startDate"] = startDate;
    map["user"] = User.getSubUserParams(user);
    map["chairId"] = null;
    map["message"] = null;
    map["messageDate"] = null;
    map["isOnline"] = true;
    return map;
  }
}
