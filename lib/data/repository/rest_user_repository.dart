import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';

abstract class RestUserRepository {
  Future<RestUser?> addRestUser(String id, DateTime startDate, User user);
  Future<void> deleteRestUser(String id);
  Stream<RestUser> onSnapshotRestUser();
}
