import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/ui/widgets/white_app_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserScreen extends HookConsumerWidget {
  final userId;
  UserScreen({required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: WhiteAppBar.build("ユーザ名", null),
      body: Center(
        child: Text("User Screen"),
      ),
    );
  }
}
