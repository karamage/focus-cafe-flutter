import 'package:focus_cafe_flutter/data/models/block_user.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';

abstract class BlockUserRepository {
  Future<BlockUser?> addBlockUser(String userId, User blockUser);
  Future<List<BlockUser>> getBlockUsers(String userId, DateTime? lastDate, int limit);
  Future<void> deleteBlockUser(String userId, User blockUser);
}
