import 'dart:io';

import 'package:focus_cafe_flutter/data/models/user.dart';

abstract class UserRepository {
  Future<User?> getUser(String id);
  Future<User?> addUser(String id, String nickname, String desc);
  Future<User?> updateUserNameDesc(String id, String name, String desc);
  Future<User?> updateUserTotalPoint(String id, int totalPoint);
  Future<User?> updateUserTotalLikedCount(String id, int addCount);
  Future<User?> updateUserUnreadCount(String id, int addCount);
  Future<String?> uploadImage(String id, File file);
}
