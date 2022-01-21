import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/notification.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';

abstract class NotificationRepository {
  Future<Notification?> addLikeNotification(
      User toUser,
      User fromUser,
      Done done,
      );
  Future<List<Notification>> getNotifications(String userId, DateTime? lastDate, int limit);
}
