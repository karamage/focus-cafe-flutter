import 'package:focus_cafe_flutter/data/models/realtime_update_type.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'focus_user.freezed.dart';
part 'focus_user.g.dart';

@freezed
abstract class FocusUser with _$FocusUser {
  const factory FocusUser({
    String? id,
    RealtimeUpdateType? updateType,
    DateTime? startDate,
    User? user,
    int? focusTime,
    @Default(false) bool isOnline,
    int? todayCount,
    @Default(false) bool isQuest,
    @Default(false) bool isPublicQuest,
  }) = _FocusUser;

  factory FocusUser.fromJson(Map<String, dynamic> json) =>
      _$FocusUserFromJson(json);

  /*
  // User作成の際のパラメータ
  static Map<String, dynamic> addRestUserParams(
      String id,
      DateTime startDate,
      User user,
      ) {
    Map<String, dynamic> map = Map();
    map[ID_KEY] = id;
    map["startDate"] = startDate;
    map["user"] = User.getSubUserParams(user);
    map["chairId"] = null;
    map["message"] = null;
    map["messageDate"] = null;
    map["isOnline"] = true;
    return map;
  }
  */
}
