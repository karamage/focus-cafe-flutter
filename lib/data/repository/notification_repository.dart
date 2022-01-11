import 'package:focus_cafe_flutter/data/models/notification.dart';
import 'package:focus_cafe_flutter/data/models/notification_type.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';

abstract class NotificationRepository {
  Future<Notification?> addNotification(
      User toUser,
      User fromUser,
      String body,
      NotificationType type,
      String doneId,
      );
  Future<List<Notification>> getNotifications(String userId, DateTime? lastDate, int limit);
}
