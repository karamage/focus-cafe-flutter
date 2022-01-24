import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/notification.dart';
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
  String _userId = "";
  final LIST_LIMIT = 20;

  Future<void> onRefresh() async {
    state = state.copyWith(isLoading: true);
    await reload(_userId);
  }

  Future<void> reload(String userId) async {
    _userId = userId;
    _clear();
    final list = await _getNotifications(userId);
    if (list.length > 0) _lastItem = list.last;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(items: list, isLoading: false);
  }

  Future<void> next() async {
    if (state.isLoading == true || _isLast) return;
    state = state.copyWith(isLoading: true);
    final list = await _getNotifications(_userId);
    _lastItem = list.length > 0 ? list.last : null;
    _isLast = list.length < LIST_LIMIT;
    state = state.copyWith(items: [...state.items]..addAll(list), isLoading: false);
  }

  Future<void> addLikeNotification(
      User toUser,
      User fromUser,
      Done done,
    ) async {
    await _repository.addLikeNotification(toUser, fromUser, done);
  }

  Future<List<Notification>> _getNotifications(String userId) async {
    return await _repository.getNotifications(userId, _lastItem?.createdAt, LIST_LIMIT);
  }

  _clear() {
    _isLast = false;
    _lastItem = null;
  }
}