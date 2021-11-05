import 'package:focus_cafe_flutter/data/models/focus_user.dart';
import 'package:focus_cafe_flutter/data/models/focus_users.dart';
import 'package:focus_cafe_flutter/data/models/realtime_update_type.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:focus_cafe_flutter/data/models/rest_users.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/focus_user_repository.dart';
import 'package:focus_cafe_flutter/data/repository/rest_user_repository.dart';
import 'package:focus_cafe_flutter/util/local_storage_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FocusUsersNotifier extends StateNotifier<FocusUsers> {
  FocusUsersNotifier(FocusUserRepository repository,
      [String? userId])
      : _repository = repository,
        _userId = userId,
        super(const FocusUsers()) {
        () async {
      _userId ??= await LocalStorageManager.getMyUserId();
    }();
  }

  final FocusUserRepository _repository;

  String? _userId;

  Future<FocusUser?> addFocusUser(User myUser, int focusTime, int todayCount) async {
    final userId = _userId;
    if (userId != null) {
      return _repository.addFocusUser(userId, DateTime.now(), myUser, focusTime, todayCount);
    } else {
      return null;
    }
  }

  Future<void> deleteFocusUser() async {
    final userId = _userId;
    if (userId != null) {
      await _repository.deleteFocusUser(userId);
    }
  }

  calcRemainingTime(DateTime now) {
    final focusUsers = [...state.items]
        .map((user) => user.copyWith(remainingTime: user.focusTime - now.difference(user.startDate ?? now).inSeconds))
        .toList();
    state = state.copyWith(items: focusUsers);
  }

  void onSnapshotFocusUser() async {
    final users = _repository.onSnapshotFocusUser();
    await for (final user in users) {
      print("FocusUsersNotifier ${user.updateType} ${user.id} ${user.user?.name}");
      var _items = [...state.items];
      final index = _items.indexWhere((item) => item.id == user.id);
      if (user.updateType == RealtimeUpdateType.removed) {
        if (index > -1) {
          _items.removeAt(index);
          state = state.copyWith(items: _items);
        }
      } else if (user.updateType == RealtimeUpdateType.added)  {
        if (index == -1) {
          _items.insert(0, user);
          state = state.copyWith(items: _items);
        }
      } else if (user.updateType == RealtimeUpdateType.modified)  {
        if (index > -1) {
          _replaceItem(_items, user);
        }
      }
    }
  }

  _replaceItem(List<FocusUser> _items, FocusUser item) {
    final index = _items.indexWhere((_item) => _item.id == item.id);
    if (index > -1) {
      _items.removeAt(index);
      _items.insert(index, item);
      state = state.copyWith(items: _items);
    }
  }
}

