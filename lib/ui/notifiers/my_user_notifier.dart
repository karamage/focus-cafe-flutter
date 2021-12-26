import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/user_repository.dart';
import 'package:focus_cafe_flutter/util/local_storage_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyUserNotifier extends StateNotifier<User> {
  MyUserNotifier({required UserRepository repository})
      : _repository = repository,
        super(const User()) {}
  final UserRepository _repository;

  Future<void> reload() async {
    final myUserId = await LocalStorageManager.getMyUserId();
    if (myUserId != null) {
      final user = await _repository.getUser(myUserId);
      print("getUser myUser=${user}");
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

  Future<void> saveMyUser(User user) async {
    final id = user.id;
    if (id != null) await LocalStorageManager.setMyUserId(id);
    await LocalStorageManager.setMyName(user.name);
  }

  Future<User?> updateUserTotalPoint(int addPoint) async {
    final myUserId = await LocalStorageManager.getMyUserId();
    if (myUserId == null) return null;
    final user = await _repository.getUser(myUserId);
    if (user == null) return null;
    final preTotalPoint = user.totalPoint;
    final updatedUser = await _repository.updateUserTotalPoint(myUserId, preTotalPoint + addPoint);
    if (updatedUser != null) state = updatedUser;
    return state.copyWith();
  }


  Future<String?> getMyUserId() async => await LocalStorageManager.getMyUserId();
  Future<String?> getMyUserName() async => await LocalStorageManager.getMyName();
}