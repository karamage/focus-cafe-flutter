import 'package:focus_cafe_flutter/data/converter/datetime_converter.dart';
import 'package:focus_cafe_flutter/data/models/realtime_update.dart';
import 'package:focus_cafe_flutter/data/models/realtime_update_type.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/util/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'focus_user.freezed.dart';
part 'focus_user.g.dart';

class FocusUserRealtime extends RealtimeUpdate {
  final FocusUser focusUser;
  FocusUserRealtime({required this.focusUser});
}

@freezed
abstract class FocusUser with _$FocusUser {
  const factory FocusUser({
    String? id,
    @DatetimeConverter() DateTime? startDate,
    User? user,
    @Default(INIT_FOCUS_TIME_SEC) int focusTime,
    int? remainingTime,
    @Default(false) bool isOnline,
    int? todayCount,
    @Default(false) bool isQuest,
    @Default(false) bool isPublicQuest,
  }) = _FocusUser;

  factory FocusUser.fromJson(Map<String, dynamic> json) =>
      _$FocusUserFromJson(json);

  // User作成の際のパラメータ
  static Map<String, dynamic> addFocusUserParams(
      String id,
      DateTime startDate,
      User user,
      int focusTime,
      int todayCount
      ) {
    Map<String, dynamic> map = Map();
    map[ID_KEY] = id;
    map["startDate"] = startDate;
    map["user"] = User.getSubUserParams(user);
    map["focusTime"] = focusTime;
    map["isOnline"] = true;
    map["todayCount"] = todayCount;
    return map;
  }

  static FocusUser createFocusUserParams(
      String id,
      DateTime startDate,
      User user,
      int focusTime,
      int todayCount
      ) {
    return new FocusUser(
      id: id,
      startDate: startDate,
      user: User.getSubUserParamsObject(user),
      focusTime: focusTime,
      isOnline: true,
      todayCount: todayCount,
    );
  }
}
