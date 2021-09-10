import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/auth_repository.dart';
import 'package:focus_cafe_flutter/util/constants.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDatasource _ds;
  AuthRepositoryImpl({required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<User?> login() async {
    final ret = await _ds.signInAnonymously();
    if (ret == null) return null;
    print("login ok ID_KEY=${ID_KEY} id=${ret[ID_KEY]}");
    return User().copyWith(id: ret[ID_KEY]);
  }
}
