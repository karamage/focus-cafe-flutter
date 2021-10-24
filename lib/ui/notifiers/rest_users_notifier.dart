import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:focus_cafe_flutter/data/models/rest_users.dart';
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

  Done? _lastItem;
  bool _isLast = false;
  String? _userId;

  Future<RestUser?> addRestUser() async {
    // TODO
    return null;
  }

  void onSnapshotRestUser() async {
    final users = _repository.onSnapshotRestUser();
    await for (final user in users) {
      // TODO TODO
      print("RestUsersNotifier ${user.id} ${user.user?.name}");
    }
  }
}

