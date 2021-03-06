import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:focus_cafe_flutter/data/models/focus_user.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/focus_user_repository.dart';

class FocusUserRepositoryImpl implements FocusUserRepository {
  final RemoteDatasource _ds;
  FocusUserRepositoryImpl({required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<FocusUser?> addFocusUser(String id, DateTime startDate, User user, int focusTime, int todayCount) async {
    return await _ds.addFocusUser(id, startDate, user, focusTime, todayCount);
  }

  @override
  Future<void> deleteFocusUser(String id) async {
    await _ds.deleteFocusUser(id);
  }

  @override
  Stream<FocusUserRealtime> onSnapshotFocusUser() {
    return _ds.onSnapshotFocusUser();
  }
}
