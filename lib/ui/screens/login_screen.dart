import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/models/app_state_type.dart';
import 'package:focus_cafe_flutter/data/providers/app_state_provider.dart';
import 'package:focus_cafe_flutter/data/providers/auth_provider.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/ui/viewmodels/app_state_view_model.dart';
import 'package:focus_cafe_flutter/ui/viewmodels/auth_view_model.dart';
import 'package:focus_cafe_flutter/ui/viewmodels/my_user_view_model.dart';
import 'package:focus_cafe_flutter/util/alert_dialog_manager.dart';
import 'package:focus_cafe_flutter/util/loading_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  void onStart(AuthViewModel authViewModel, MyUserViewModel myUserViewModel, BuildContext context,
      TextEditingController userNameController, AppStateViewModel appStateViewModel) async {
    final String nickname = userNameController.text;
    if (nickname == "") {
      AlertDialogManager.showAlertDialog(context, "エラー", "ニックネームを入力してください");
      return;
    }
    LoadingDialog.showLoading(context);
    var user = await authViewModel.login();
    if (user != null) {
      user = await myUserViewModel.addUser(user.id ?? "", nickname);
      if (user != null) {
        myUserViewModel.saveMyUser(user);
        await appStateViewModel.setAppStateType(AppStateType.loginCompleted);
        await authViewModel.setIsLogined(true);
      } else {
        AlertDialogManager.showAlertDialog(context, "エラー", "ユーザーの作成に失敗しました");
      }
    } else {
      AlertDialogManager.showAlertDialog(context, "エラー", "ログインに失敗しました");
    }
    LoadingDialog.hideLoading(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.read(authProvider.notifier);
    final myUserViewModel = ref.read(myUserProvider.notifier);
    final appStateViewModel = ref.read(appStateProvider.notifier);
    final userNameController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Focus Cafe Login')),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    //autofocus: true,
                      decoration: InputDecoration(
                          labelText: "ニックネーム",
                          hintText: "ニックネームを入力してください"
                      ),
                      controller: userNameController
                  ),
                  ElevatedButton(
                    child: Text('はじめる'),
                    //color: Theme.of(context).primaryColor,
                    //textColor: Colors.white,
                    onPressed: () {
                      onStart(authViewModel, myUserViewModel, context, userNameController, appStateViewModel);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
