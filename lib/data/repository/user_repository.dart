import 'package:focus_cafe_flutter/data/models/user.dart';

abstract class UserRepository {
  Future<User?> getUser(String id);
  Future<User?> addUser(String id, String nickname, String desc);
}