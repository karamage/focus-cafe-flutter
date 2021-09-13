import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    String? id,
    @Default("") String name,
    @Default("") String desc,
    @Default("") String photoUrl,
    @Default(0) int totalPoint,
    @Default(false) bool isAnonymous,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  // User作成の際のパラメータ
  static Map<String, dynamic> addUserParams({String? id, String? name, String? desc, bool? isAnonymous}) {
    Map<String, dynamic> map = Map();
    map["id"] = id;
    map["name"] = name;
    map["desc"] = desc;
    map["isAnonymous"] = isAnonymous;
    if (isAnonymous == true) {
      map["photoUrl"] = "/user_anonymous.png";
    }
    map["totalPoint"] = 0;
    return map;
  }

  /*
  static Map<String, dynamic> updateUserParams({String? id, String? nickname, String? desc}) {
    Map<String, dynamic> map = Map();
    map["id"] = id;
    map["nickname"] = nickname;
    map["desc"] = desc;
    return map;
  }


  // ItemのサブコレクションのUserに設定するパラメータ
  static Map<String, dynamic> getSubUserParams(User u) {
    Map<String, dynamic> map = Map();
    map["id"] = u.id;
    map["nickname"] = u.nickname;
    map["desc"] = u.desc;
    map["totalLikedCount"] = u.totalLikedCount;
    if (u.imageUrl != null) map["imageUrl"] = u.imageUrl;
    return map;
  }

  static Map<String, dynamic> updateTotalLikedCountParams(int count, String id) {
    Map<String, dynamic> map = Map();
    map["id"] = id;
    map["totalLikedCount"] = count;
    return map;
  }
   */
}
