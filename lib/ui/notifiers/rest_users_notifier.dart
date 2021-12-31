import 'package:focus_cafe_flutter/data/models/realtime_update_type.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:focus_cafe_flutter/data/models/rest_users.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/rest_user_repository.dart';
import 'package:focus_cafe_flutter/util/local_storage_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RestUsersNotifier extends StateNotifier<RestUsers> {
  RestUsersNotifier(RestUserRepository repository,
      [String? userId])
      : _repository = repository,
        _userId = userId,
        super(const RestUsers()) {
        () async {
      _userId ??= await LocalStorageManager.getMyUserId();
    }();
  }

  final RestUserRepository _repository;

  String? _userId;

  Future<RestUser?> addRestUser(User myUser) async {
    if (_userId == null) {
      _userId ??= await LocalStorageManager.getMyUserId();
    }
    final userId = _userId;
    print("addRestUser() _userId=${_userId}");
    if (userId != null) {
      return _repository.addRestUser(userId, DateTime.now(), myUser);
    } else {
      return null;
    }
  }

  Future<RestUser?> sitRestUser(User myUser, int chairId) async {
    final userId = _userId;
    if (userId != null) {
      return _repository.sitRestUser(userId, DateTime.now(), myUser, chairId);
    } else {
      return null;
    }
  }

  Future<void> deleteRestUser() async {
    final userId = _userId;
    if (userId != null) {
      await _repository.deleteRestUser(userId);
    }
  }

  void onSnapshotRestUser() async {
    final rusers = _repository.onSnapshotRestUser();
    await for (final ruser in rusers) {
      final user = ruser.restUser;
      print("RestUsersNotifier ${ruser.updateType} ${user.id} ${user.user?.name}");
      var _items = [...state.items];
      final index = _items.indexWhere((item) => item.id == user.id);
      if (ruser.updateType == RealtimeUpdateType.removed) {
        if (index > -1) {
          _items.removeAt(index);
          state = state.copyWith(items: _items);
        }
      } else if (ruser.updateType == RealtimeUpdateType.added)  {
        if (index == -1) {
          _items.insert(0, user);
          state = state.copyWith(items: _items);
        }
      } else if (ruser.updateType == RealtimeUpdateType.modified)  {
        if (index > -1) {
          _replaceItem(_items, user);
        }
      }
    }
  }

  _replaceItem(List<RestUser> _items, RestUser item) {
    final index = _items.indexWhere((_item) => _item.id == item.id);
    if (index > -1) {
      _items.removeAt(index);
      _items.insert(index, item);
      state = state.copyWith(items: _items);
    }
  }

}

