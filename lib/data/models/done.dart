import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_cafe_flutter/data/converter/datetime_converter.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/util/constants.dart';
import 'package:focus_cafe_flutter/util/date_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'done.freezed.dart';
part 'done.g.dart';

@freezed
abstract class Done with _$Done{
  const factory Done({
    String? id,
    @DatetimeConverter() DateTime? startDate,
    @DatetimeConverter() DateTime? endDate,
    @Default(0) int totalElapsedTime,
    User? user,
    @Default("") String body,
    @Default(false) bool isEditForm,
    @Default(null) int? likeCount,
    @Default([]) List<String?>? likedUserIds,
    @Default([]) List<String?>? likedUserNames,
    @Default([]) List<String?>? likedUserPhotoUrls,
    @Default("") String? photoUrl,
    //Comment? latestComment,
    @Default(null) int? commentCount,
    @Default(false) bool isCommentForm,
    @Default("") String? questId,
    @Default("") String? questTitle,
  }) = _Done;
  factory Done.fromJson(Map<String, dynamic> json) => _$DoneFromJson(json);

  // freezedがエラーをはくようになってしまった
  // String endDateMMDD() => DateUtil.mmdd(endDate);

  static Map<String, dynamic> createParams(
      DateTime startDate,
      DateTime endDate,
      int totalElapsedTime,
      User user,
      String body,
      [
        String? questId,
        String? questTitle,
      ]
      ) {
    Map<String, dynamic> map = Map();
    map["startDate"] = startDate;
    map["endDate"] = endDate;
    map["totalElapsedTime"] = totalElapsedTime;
    map["user"] = User.getSubUserParams(user);
    map["body"] = body;
    if (questId != null) {
      map["questId"] = questId;
    }
    if (questTitle != null) {
      map["questTitle"] = questTitle;
    }
    return map;
  }

  static Done createDoneParams(
      DateTime startDate,
      DateTime endDate,
      int totalElapsedTime,
      User user,
      String body,
      [
        String? questId,
        String? questTitle,
      ]
      ) {
    return new Done(
      startDate: startDate,
      endDate: endDate,
      totalElapsedTime: totalElapsedTime,
      user: User.getSubUserParamsObject(user),
      body: body
    );
  }

  static Map<String, dynamic> createEditBodyParams(
      String id,
      String body,
      ) {
    Map<String, dynamic> map = Map();
    map[ID_KEY] = id;
    map["body"] = body;
    return map;
  }

  /*
  static Map<String, dynamic> createAddLikeParams(String itemId, int likeCount, List<String> likedUserIds) {
    Map<String, dynamic> map = Map();
    map["id"] = itemId;
    map["likeCount"] = likeCount;
    map["likedUserIds"] = likedUserIds;
    return map;
  }
  */

}
