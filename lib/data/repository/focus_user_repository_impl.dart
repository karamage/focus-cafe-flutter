import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:focus_cafe_flutter/data/models/focus_user.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/focus_user_repository.dart';
import 'package:focus_cafe_flutter/util/constants.dart';

class FocusUserRepositoryImpl implements FocusUserRepository {
  final RemoteDatasource _ds;
  FocusUserRepositoryImpl({required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<FocusUser?> addFocusUser(String id, DateTime startDate, User user, int focusTime, int todayCount) async {
    final params = FocusUser.addFocusUserParams(id, startDate, user, focusTime, todayCount);
    final json = await _ds.addFocusUser(params);
    return json != null ? FocusUser.fromJson(json) : null;
  }

  @override
  Future<void> deleteFocusUser(String id) async {
    Map<String, dynamic> params = Map();
    params[ID_KEY] = id;
    await _ds.deleteFocusUser(params);
  }

  @override
  Stream<FocusUserRealtime> onSnapshotFocusUser() {
    return _ds.onSnapshotFocusUser();
  }
}
