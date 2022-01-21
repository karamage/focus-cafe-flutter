import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/notification.dart';
import 'package:focus_cafe_flutter/data/models/notification_type.dart';
import 'package:focus_cafe_flutter/data/models/notifications.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/repository/notification_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationsNotifier extends StateNotifier<Notifications> {
  NotificationsNotifier(NotificationRepository repository)
      : _repository = repository,
        super(Notifications());

  final NotificationRepository _repository;

  Notification? _lastItem;
  bool _isLast = false;
  final LIST_LIMIT = 20;

  Future<void> reload(String userId) async {
    _clear();
    final list = await _getNotifications(userId);
    if (list.length > 0) _lastItem = list.last;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(items: list, isLoading: false);
  }

  Future<Notification?> addLikeNotification(
      User toUser,
      User fromUser,
      Done done,
      ) {
    final body = done.body.length > 10 ? "${done.body.substring(0, 10)}..." : done.body;
    final targetStr = done.body != "" ? "「${body}」":"${done.endDate}";
    final message = "${fromUser.name} さんが、${targetStr}の集中に対して、いいね!しています。";
    return _repository.addNotification(toUser, fromUser, message, NotificationType.like, done.id);
  }

  Future<List<Notification>> _getNotifications(String userId) async {
    return await _repository.getNotifications(userId, _lastItem?.createdAt, LIST_LIMIT);
  }

  _clear() {
    _isLast = false;
    _lastItem = null;
  }
}