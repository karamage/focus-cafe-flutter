import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDatasource _ds;
  UserRepositoryImpl({required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<User?> getUser(String id) async {
    return await _ds.getUser(id);
  }

  @override
  Future<User?> addUser(String id, String nickname, String desc) async {
    final params = User.addUserParams(id: id, name: nickname, desc: desc, isAnonymous: true);
    final json = await _ds.addUser(params);
    return json != null ? User.fromJson(json) : null;
  }

  @override
  Future<User?> updateUserTotalPoint(String id, int totalPoint) async {
    final params = User.updateTotalPointParams(id, totalPoint);
    final json = await _ds.updateUser(params);
    return json != null ? User.fromJson(json) : null;
  }
}
