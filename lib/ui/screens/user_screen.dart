import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/providers/user_provider.dart';
import 'package:focus_cafe_flutter/ui/widgets/white_app_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserScreen extends HookConsumerWidget {
  final userId;
  UserScreen({required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider(userId));
    final _userNotifier = ref.read(userProvider(userId).notifier);
    useEffect((){
      _userNotifier.reload();
    }, []);
    return Scaffold(
      appBar: WhiteAppBar.build("プロフィール", null),
      body: Center(
        child: Text("User Screen ${user.name}"),
      ),
    );
  }
}
