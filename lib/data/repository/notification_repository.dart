import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/notification.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';

abstract class NotificationRepository {
  Future<void> addLikeNotification(
      User toUser,
      User fromUser,
      Done done,
      );
  Future<List<Notification>> getNotifications(String userId, DateTime? lastDate, int limit);
  Future<void> updateIsRead(String notifyId, bool isRead);
}
