import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/data/providers/notifications_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/notifications_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationsScreen extends HookConsumerWidget {
  late NotificationsNotifier _notifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationsProvider);
    final myUser = ref.watch(myUserProvider);
    _notifier = ref.read(notificationsProvider.notifier);
    useEffect((){
      //_notifier.reload();
      // TODO 既読処理
      return null;
    }, []);
    return Center(
      child: Text("Notifications List"),
    );
    /*
    return EasyListView(
      items: state.items,
      onRefresh: _notifier.onRefresh,
      onNext: _notifier.next,
      buildCells: (items) =>
          items.map((item) =>
              DoneCell(
                done: item as Done,
                myUserId: myUser.id ?? "",
                tapLike: tapLike,
              )
          ).toList(),
      isLoading: state.isLoading,
      loading: LoadingIndicator(),
    );
     */
  }
}
