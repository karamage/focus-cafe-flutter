import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/user_repository.dart';
import 'package:focus_cafe_flutter/util/local_storage_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyUserViewModel extends StateNotifier<User> {
  MyUserViewModel({required UserRepository repository})
      : _repository = repository,
        super(const User()) {}
  final UserRepository _repository;

  Future<void> reload() async {
    final myUserId = await LocalStorageManager.getMyUserId();
    if (myUserId != null) {
      final user = await _repository.getUser(myUserId);
      if (user != null) state = user;
    }
  }

  Future<User?> addUser(String uuid, String nickname) async {
    final user = await _repository.addUser(uuid, nickname, "");
    if (user != null) {
      state = user;
      return state.copyWith();
    }
    return null;
  }
}