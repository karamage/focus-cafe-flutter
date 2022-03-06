import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:focus_cafe_flutter/data/models/block_user.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/block_user_repository.dart';

class BlockUserRepositoryImpl implements BlockUserRepository {
  final RemoteDatasource _ds;

  BlockUserRepositoryImpl({required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<BlockUser?> addBlockUser(String userId, User blockUser) async {
    return await _ds.addBlockUser(userId, blockUser);
  }

  @override
  Future<List<BlockUser>> getBlockUsers(String userId, DateTime? lastDate, int limit) async {
    return await _ds.getBlockUsers(userId, lastDate, limit);
  }

  @override
  Future<void> deleteBlockUser(String userId, User blockUser) async {
    return await _ds.deleteBlockUser(userId, blockUser.id!);
  }
}