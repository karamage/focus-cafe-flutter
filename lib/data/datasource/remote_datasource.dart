import 'dart:io';

import 'package:focus_cafe_flutter/data/models/activity.dart';
import 'package:focus_cafe_flutter/data/models/block_user.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/focus_user.dart';
import 'package:focus_cafe_flutter/data/models/notification.dart';
import 'package:focus_cafe_flutter/data/models/notification_type.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';

abstract class RemoteDatasource {
  initializeApp();
  Future<Map<String, dynamic>?> signInAnonymously();
  Future<User?> getUser(String userId);
  Future<User?> addUser(String id, String nickname, String desc, bool isAnonymouse);
  Future<User?> updateUser(Map<String, dynamic> params);
  Future<List<Done>> getOurDones(DateTime? lastDate, int limit);
  Future<List<Done>> getUserDones(String userId, DateTime? lastDate, int limit);
  Future<Done?> getDone(String doneId);
  Future<Done?> addDone(
    DateTime startDate,
    DateTime endDate,
    int totalElapsedTime,
    User user,
    String body,
    [
      String? questId,
      String? questTitle,
    ]
  );
  Future<Done?> editDone(Map<String, dynamic> params);
  Future<Activity?> getActivity(String userId);
  Future<Activity?> updateActivity(Map<String, dynamic> params);
  Future<RestUser?> addRestUser(String id, DateTime startDate, User user);
  Future<RestUser?> updateRestUser(Map<String, dynamic> params);
  Future<void> deleteRestUser(Map<String, dynamic> params);
  Stream<RestUserRealtime> onSnapshotRestUser();
  Future<FocusUser?> addFocusUser(String id, DateTime startDate, User user, int focusTime, int todayCount);
  Future<void> deleteFocusUser(String userId);
  Stream<FocusUserRealtime> onSnapshotFocusUser();
  Future<void> addNotification(
    User toUser,
    User fromUser,
    String body,
    NotificationType type,
    String doneId,
  );
  Future<List<Notification>> getNotifications(String userId, DateTime? lastDate, int limit);
  Future<Notification?> updateNotification(Map<String, dynamic> params);

  Future<String?> uploadImage(String userId, File file);
  Future<BlockUser?> addBlockUser(String userId, User blockUser);
  Future<List<BlockUser>> getBlockUsers(String userId, DateTime? lastDate, int limit);
  Future<void> deleteBlockUser(String userId, String blockUserId);
}
