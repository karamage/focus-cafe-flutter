import 'package:focus_cafe_flutter/data/models/auth.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthNotifier extends StateNotifier<Auth> {
  AuthNotifier({required AuthRepository repository}) : _repository = repository, super(const Auth(isLogined: false)) {}
  final AuthRepository _repository;

  Future<User?> login() async {
    return await _repository.login();
  }

  Future<void> setIsLogined(bool isLogined) async {
    state = state.copyWith(isLogined: isLogined);
  }
}
