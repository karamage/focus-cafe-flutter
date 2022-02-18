import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier({required String userId, required UserRepository repository})
      : _userId = userId, _repository = repository,
        super(const User()) {}
  final UserRepository _repository;
  final String _userId;

  Future<void> reload() async {
    final user = await _repository.getUser(_userId);
    if (user != null) state = user;
  }
}