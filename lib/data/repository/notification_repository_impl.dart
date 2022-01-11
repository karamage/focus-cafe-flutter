import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:focus_cafe_flutter/data/models/notification.dart';
import 'package:focus_cafe_flutter/data/models/notification_type.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final RemoteDatasource _ds;

  NotificationRepositoryImpl({required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<Notification?> addNotification(
      User toUser,
      User fromUser,
      String body,
      NotificationType type,
      String doneId,
      ) async {
    return await _ds.addNotification(toUser, fromUser, body, type, doneId);
  }
  @override
  Future<List<Notification>> getNotifications(String userId, DateTime? lastDate, int limit) async {
    return await _ds.getNotifications(userId, lastDate, limit);
  }
}