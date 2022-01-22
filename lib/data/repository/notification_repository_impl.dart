import 'package:focus_cafe_flutter/data/datasource/remote_datasource.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/notification.dart';
import 'package:focus_cafe_flutter/data/models/notification_type.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/notification_repository.dart';
import 'package:focus_cafe_flutter/util/date_util.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final RemoteDatasource _ds;

  NotificationRepositoryImpl({required RemoteDatasource ds}) : _ds = ds;

  @override
  Future<void> addLikeNotification(
      User toUser,
      User fromUser,
      Done done,
      ) async {
    final body = done.body.length > 10 ? "${done.body.substring(0, 10)}..." : done.body;
    final targetStr = done.body != "" ? "「${body}」":"「${DateUtil.mmddhhMM(done.endDate)}」";
    final message = "${fromUser.name} さんが、${targetStr}の集中に対して、いいね!しています。";
    await _ds.addNotification(toUser, fromUser, message, NotificationType.like, done.id);
  }
  @override
  Future<List<Notification>> getNotifications(String userId, DateTime? lastDate, int limit) async {
    return await _ds.getNotifications(userId, lastDate, limit);
  }
}