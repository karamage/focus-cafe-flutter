import 'dart:io';

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
    return await _ds.addUser(id, nickname, desc, true);
  }

  @override
  Future<User?> updateUserNameDesc(String id, String name, String desc) async {
    final params = User.updateUserNameDesc(id, name, desc);
    return await _ds.updateUser(params);
  }

  @override
  Future<User?> updateUserTotalPoint(String id, int totalPoint) async {
    final params = User.updateTotalPointParams(id, totalPoint);
    return await _ds.updateUser(params);
  }

  @override
  Future<User?> updateUserTotalLikedCount(String id, int addCount) async {
    final preUser = await _ds.getUser(id);
    if (preUser != null) {
      final preCount = preUser.totalLikedCount;
      final params = User.updateTotalLikedCountParams(id, preCount + addCount);
      return await _ds.updateUser(params);
    }
  }

  @override
  Future<User?> updateUserUnreadCount(String id, int addCount) async {
    final preUser = await _ds.getUser(id);
    if (preUser != null) {
      final preCount = preUser.unreadCount;
      final params = User.updateUnreadCountParams(id, preCount + addCount);
      return await _ds.updateUser(params);
    }
  }

  @override
  Future<String?> uploadImage(String id, File file) async {
    return await _ds.uploadImage(id, file);
  }
}
