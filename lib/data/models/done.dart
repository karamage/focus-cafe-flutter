import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/util/date_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'done.freezed.dart';
part 'done.g.dart';

@freezed
abstract class Done with _$Done{
  const factory Done({
    String? id,
    DateTime? startDate,
    DateTime? endDate,
    @Default(0) int totalElapsedTime,
    User? user,
    @Default("") String body,
    @Default(false) bool isEditForm,
    @Default(0) int likeCount,
    @Default([]) List<String?>? likedUserIds,
    @Default([]) List<String?>? likedUserNames,
    @Default([]) List<String?>? likedUserPhotoUrls,
    @Default("") String? photoUrl,
    //Comment? latestComment,
    @Default(0) int? commentCount,
    @Default(false) bool isCommentForm,
    @Default("") String? questId,
    @Default("") String? questTitle,
  }) = _Done;
  factory Done.fromJson(Map<String, dynamic> json) => _$DoneFromJson(json);

  // freezedがエラーをはくようになってしまった
  // String endDateMMDD() => DateUtil.mmdd(endDate);

  /*
  static Map<String, dynamic> createParams(
      String title,
      String body,
      bool isPublic,
      [
        String category,
        String imageUrl,
        String editItemId
      ]
      ) {
    Map<String, dynamic> map = Map();
    map["title"] = title;
    map["body"] = body;
    if (editItemId == null) {
      map["likeCount"] = 0;
      map["starCount"] = 0;
      map["commentCount"] = 0;
    } else {
      map["id"] = editItemId;
    }
    map["isPublic"] = isPublic;
    if (category != null) {
      map["category"] = category;
    }
    if (imageUrl != null) {
      map["imageUrl"] = imageUrl;
    }
    return map;
  }

  static Map<String, dynamic> createAddLikeParams(String itemId, int likeCount, List<String> likedUserIds) {
    Map<String, dynamic> map = Map();
    map["id"] = itemId;
    map["likeCount"] = likeCount;
    map["likedUserIds"] = likedUserIds;
    return map;
  }
  */

}
