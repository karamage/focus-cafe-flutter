import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/providers/app_state_provider.dart';
import 'package:focus_cafe_flutter/ui/viewmodels/app_state_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  void onStart(/*AuthViewModel authViewModel, MyUserViewModel myUserViewModel,*/ BuildContext context,
      TextEditingController userNameController, AppStateViewModel appStateViewModel) async {
    final String nickname = userNameController.text;
    /*
    if (nickname == "") {
      AlertDialogManager.showAlertDialog(context, "エラー", "ニックネームを入力してください");
      return;
    }
    LoadingDialog.showLoading(context);
    try {
      var user = await authViewModel.login();
      user = await myUserViewModel.addUser(user.id, nickname);
      myUserViewModel.saveMyUser(user);
      LoadingDialog.hideLoading(context);
      await authViewModel.setIsLogined(true);
      await appStateViewModel.setAppStateType(AppStateType.loginCompleted);
    } catch(e) {
      print(e); //Bad state
      LoadingDialog.hideLoading(context);
      AlertDialogManager.showAlertDialog(context, "エラー", "ログインに失敗しました");
    }
     */
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final authViewModel = useProvider(authProvider);
    //final myUserViewModel = useProvider(myUserProvider);
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
                      onStart(/*authViewModel, myUserViewModel,*/ context, userNameController, appStateViewModel);
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
