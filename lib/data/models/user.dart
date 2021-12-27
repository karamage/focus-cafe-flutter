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

  static User createUserParams({String? id, String? name, String? desc, bool? isAnonymous}) {
    return User(
      id: id,
      name: name ?? "",
      desc: desc ?? "",
      photoUrl: isAnonymous ?? false ? "/user_anonymous.png": "", // TODO photoUrlを指定できるように
      totalPoint: 0,
      isAnonymous: isAnonymous ?? false,
    );
  }

  /*
  static Map<String, dynamic> updateUserParams({String? id, String? nickname, String? desc}) {
    Map<String, dynamic> map = Map();
    map["id"] = id;
    map["nickname"] = nickname;
    map["desc"] = desc;
    return map;
  }
  */


  // ItemのサブコレクションのUserに設定するパラメータ
  static Map<String, dynamic> getSubUserParams(User u) {
    Map<String, dynamic> map = Map();
    map["id"] = u.id;
    map["name"] = u.name;
    map["desc"] = u.desc;
    map["isAnonymous"] = u.isAnonymous;
    map["photoUrl"] = u.photoUrl;
    map["totalPoint"] = u.totalPoint;
    return map;
  }

  static User getSubUserParamsObject(User u) {
    return new User(
      id: u.id,
      name: u.name,
      desc: u.desc,
      isAnonymous: u.isAnonymous,
      photoUrl: u.photoUrl,
      totalPoint: u.totalPoint,
    );
  }


  static Map<String, dynamic> updateTotalPointParams(String id, int totalPoint) {
    Map<String, dynamic> map = Map();
    map["id"] = id;
    map["totalPoint"] = totalPoint;
    return map;
  }

  /*
  static Map<String, dynamic> updateTotalLikedCountParams(int count, String id) {
    Map<String, dynamic> map = Map();
    map["id"] = id;
    map["totalLikedCount"] = count;
    return map;
  }
   */
}
