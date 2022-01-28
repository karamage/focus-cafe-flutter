import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/data/providers/notifications_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/my_user_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingScreen extends HookConsumerWidget {
  late MyUserNotifier _notifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationsProvider);
    final myUser = ref.watch(myUserProvider);
    _notifier = ref.read(myUserProvider.notifier);
    useEffect((){
      /*
      final userId = myUser.id;
      if (userId != null) {
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          _notifier.reload(userId);
        });
      }
       */
      return null;
    }, []);
    return Center(
      child: Text("設定"),
    );
  }
}
