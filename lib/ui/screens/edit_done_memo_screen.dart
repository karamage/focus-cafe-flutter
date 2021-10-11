import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/providers/dones_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/dones_notifier.dart';
import 'package:focus_cafe_flutter/ui/widgets/input_forms_view.dart';
import 'package:focus_cafe_flutter/ui/widgets/white_app_bar.dart';
import 'package:focus_cafe_flutter/util/alert_dialog_manager.dart';
import 'package:focus_cafe_flutter/util/loading_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditDoneMemoScreen extends HookConsumerWidget {
  final Done editDone;
  EditDoneMemoScreen({Key? key, required this.editDone}): super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bodyController = useTextEditingController();
    final notifier = ref.read(donesProvider.notifier);
    useEffect((){
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        AlertDialogManager.showAlertDialog(context, "ポモドーロタイマー完了", "お疲れ様でした。\n今の気持ちをひとこと書き残してみてください。");
      });
      return null;
    }, []);
    return Scaffold(
      appBar: WhiteAppBar.build("ひとことメモ"),
      body: InputFormsView(
        children: [
          _buildBodyForm(bodyController),
          _buildSubmitButton(notifier, bodyController, context)
        ],
      ),
    );
  }

  _submit(DonesNotifier notifier, TextEditingController bodyc, BuildContext ctx) async {
    final String body = bodyc.text;
    LoadingDialog.showLoading(ctx);
    await notifier.editDoneBody(editDone.id ?? "", body);
    LoadingDialog.hideLoading(ctx);
    Navigator.pop(ctx);
  }

  Widget _buildBodyForm(TextEditingController bodyController) {
    return TextField(
      controller: bodyController,
      maxLines: null,
      maxLength: 180,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          labelText: "ひとこと",
          hintText: "〇〇の勉強に集中できました。"
      ),
    );
  }

  Widget _buildSubmitButton(DonesNotifier notifier, TextEditingController bodyc, BuildContext ctx) {
    return ElevatedButton(
      child: Text("送信する"),
      onPressed: () => _submit(notifier, bodyc, ctx),
    );
  }
}
