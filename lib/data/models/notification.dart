import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:focus_cafe_flutter/data/converter/datetime_converter.dart';
import 'package:focus_cafe_flutter/data/models/notification_type.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
abstract class Notification with _$Notification {
  const factory Notification({
    @Default("") String id,
    @DatetimeConverter() DateTime? createdAt,
    @Default(false) bool isReaded,
    User? toUser,
    User? fromUser,
    @Default("") String body,
    @Default(NotificationType.like) NotificationType notificationType,
    String? doneId,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  static Notification createNotificationParams(
      String id,
      /* TODO
      DateTime startDate,
      DateTime endDate,
      int totalElapsedTime,
      User user,
      String body,
      [
        String? questId,
        String? questTitle,
      ]
       */
      ) {
    return new Notification(
        id: id,
        /*
        startDate: startDate,
        endDate: endDate,
        totalElapsedTime: totalElapsedTime,
        user: User.getSubUserParamsObject(user),
        body: body
         */
    );
  }

}