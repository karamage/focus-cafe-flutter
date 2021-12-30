import 'package:focus_cafe_flutter/data/converter/datetime_converter.dart';
import 'package:focus_cafe_flutter/data/models/realtime_update.dart';
import 'package:focus_cafe_flutter/data/models/realtime_update_type.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/util/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_user.freezed.dart';
part 'rest_user.g.dart';

class RestUserRealtime extends RealtimeUpdate {
  final RestUser restUser;
  RestUserRealtime({required this.restUser});
}

@freezed
abstract class RestUser with _$RestUser {
  const factory RestUser({
    String? id,
    RealtimeUpdateType? updateType,
    @DatetimeConverter() DateTime? startDate,
    User? user,
    int? chairId,
    @Default(false) bool isOnline,
  }) = _RestUser;

  factory RestUser.fromJson(Map<String, dynamic> json) =>
      _$RestUserFromJson(json);

  // User作成の際のパラメータ
  static Map<String, dynamic> addRestUserParams(
      String id,
      DateTime startDate,
      User user,
      [int? chairId]
  ) {
    Map<String, dynamic> map = Map();
    map[ID_KEY] = id;
    map["startDate"] = startDate;
    map["user"] = User.getSubUserParams(user);
    map["chairId"] = null;
    map["message"] = null;
    map["messageDate"] = null;
    map["isOnline"] = true;
    map["chairId"] = chairId;
    return map;
  }

  static RestUser createRestUserParams(
      String id,
      DateTime startDate,
      User user,
      [int? chairId]
      ) {
    return new RestUser(
      id: id,
      startDate: startDate,
      user: User.getSubUserParamsObject(user),
      chairId: chairId,
      isOnline: true,
    );
  }
}
