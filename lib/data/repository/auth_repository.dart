import 'package:focus_cafe_flutter/data/models/user.dart';

abstract class AuthRepository {
  Future<User?> login();
}