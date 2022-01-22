import 'package:focus_cafe_flutter/data/models/notifications.dart';
import 'package:focus_cafe_flutter/data/providers/notification_repository_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/notifications_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationsProvider = StateNotifierProvider.autoDispose<NotificationsNotifier, Notifications>((ref) =>
    NotificationsNotifier(
      ref.read(notificationRepositoryProvider),
    )
);
