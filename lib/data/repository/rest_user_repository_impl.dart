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
    final params = RestUser.addRestUserParams(id, startDate, user);
    final json = await _ds.addRestUser(params);
    return json != null ? RestUser.fromJson(json) : null;
  }

  @override
  Future<void> deleteRestUser(String id) async {
    Map<String, dynamic> params = Map();
    params[ID_KEY] = id;
    await _ds.deleteRestUser(params);
  }

  @override
  Stream<RestUser> onSnapshotRestUser() async* {
    final datas = _ds.onSnapshotRestUser();
    await for (final json in datas) {
      yield RestUser.fromJson(json);
    }
  }
}
