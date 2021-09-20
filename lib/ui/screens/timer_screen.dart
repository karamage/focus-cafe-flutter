import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserProvider);
    final _notifier = ref.read(myUserProvider.notifier);
    useEffect((){
      _notifier.reload();
      return null;
    }, []);
    return Center(
      child: Text("Timer myUser id = ${myUser.id} name=${myUser.name}")
    );
  }
}
