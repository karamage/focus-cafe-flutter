import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/rest_user_repository.dart';
import 'package:focus_cafe_flutter/util/constants.dart';

class RestUserRepositoryImpl implements RestUserRepository {
  final RemoteDatasource _ds;
  RestUserRepositoryImpl({required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<RestUser?> addRestUser(String id, DateTime startDate, User user) async {
    return await _ds.addRestUser(id, startDate, user);
  }

  @override
  Future<RestUser?> sitRestUser(String id, DateTime startDate, User user, int chairId) async {
    final params = RestUser.addRestUserParams(id, startDate, user, chairId);
    return await _ds.updateRestUser(params);
  }

  @override
  Future<void> deleteRestUser(String id) async {
    Map<String, dynamic> params = Map();
    params[ID_KEY] = id;
    await _ds.deleteRestUser(params);
  }

  @override
  Stream<RestUserRealtime> onSnapshotRestUser() {
    return _ds.onSnapshotRestUser();
  }
}
