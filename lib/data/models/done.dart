import 'package:focus_cafe_flutter/data/models/user.dart';
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
    /*
    @Default("") String title,
    @Default("") String body,
    @Default(0) int likeCount,
    @Default(0) int starCount,
    @Default(0) int commentCount,
    @Default(false) bool isPublic,
    @Default(CategoryType.none) CategoryType category,
    @Default([]) List<String> likedUserIds,
    User user,
    */
  }) = _Done;
  factory Done.fromJson(Map<String, dynamic> json) => _$DoneFromJson(json);

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
