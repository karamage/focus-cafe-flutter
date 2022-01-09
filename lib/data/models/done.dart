import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_cafe_flutter/data/converter/datetime_converter.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/util/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'done.freezed.dart';
part 'done.g.dart';

@freezed
abstract class Done with _$Done{
  const factory Done({
    @Default("") String id,
    @DatetimeConverter() DateTime? startDate,
    @DatetimeConverter() DateTime? endDate,
    @Default(0) int totalElapsedTime,
    User? user,
    @Default("") String body,
    @Default(null) int? likeCount,
    @Default([]) List<String?>? likedUserIds,
    @Default([]) List<String?>? likedUserNames,
    @Default([]) List<String?>? likedUserPhotoUrls,
    @Default(null) String? photoUrl,
    //Comment? latestComment,
    @Default(null) int? commentCount,
    @Default(false) bool isCommentForm,
    @Default(null) String? questId,
    @Default(null) String? questTitle,
  }) = _Done;
  factory Done.fromJson(Map<String, dynamic> json) => _$DoneFromJson(json);

  static Done createDoneParams(
      String id,
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
      id: id,
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
    return {
      ID_KEY: id,
      "body": body
    };
  }

  static Map<String, dynamic> createAddLikeParams(String itemId, int likeCount, List<String?> likedUserIds, List<String?> likedUserNames, List<String?> likedUserPhotoUrls) {
    return {
      "id": itemId,
      "likeCount": likeCount,
      "likedUserIds": likedUserIds,
      "likedUserNames": likedUserNames,
      "likedUserPhotoUrls": likedUserPhotoUrls,
    };
  }

}
