import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/models/notification.dart' as FocusCafeNotification;
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/data/providers/notifications_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/notifications_notifier.dart';
import 'package:focus_cafe_flutter/ui/widgets/easy_list_view.dart';
import 'package:focus_cafe_flutter/ui/widgets/loading_indicator.dart';
import 'package:focus_cafe_flutter/ui/widgets/notification_cell.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationsScreen extends HookConsumerWidget {
  late NotificationsNotifier _notifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationsProvider);
    final myUser = ref.watch(myUserProvider);
    _notifier = ref.read(notificationsProvider.notifier);
    useEffect((){
      final userId = myUser.id;
      if (userId != null) {
        _notifier.reload(userId);
      }
      // TODO 既読処理
      return null;
    }, []);
    return EasyListView(
      items: state.items,
      onRefresh: _notifier.onRefresh,
      onNext: _notifier.next,
      buildCells: (items) =>
          items.map((item) =>
            NotificationCell(item: item as FocusCafeNotification.Notification)
          ).toList(),
      isLoading: state.isLoading,
      loading: LoadingIndicator(),
    );
  }
}
