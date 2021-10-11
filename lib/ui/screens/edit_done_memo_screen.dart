import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/ui/widgets/white_app_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditDoneMemoScreen extends HookConsumerWidget {
  final Done editDone;
  EditDoneMemoScreen({Key? key, required this.editDone}): super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: WhiteAppBar.build("集中が完了しました"),
      body: Center(
        child: Text("Edit Done id=${editDone.id}"),
      ),
    );
  }
}
