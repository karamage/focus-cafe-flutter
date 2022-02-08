import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/my_user_notifier.dart';
import 'package:focus_cafe_flutter/ui/widgets/space_box.dart';
import 'package:focus_cafe_flutter/ui/widgets/user_avator.dart';
import 'package:focus_cafe_flutter/util/alert_dialog_manager.dart';
import 'package:focus_cafe_flutter/util/loading_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class SettingScreen extends HookConsumerWidget {
  late MyUserNotifier _notifier;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUser = ref.watch(myUserProvider);
    final nameController = useTextEditingController();
    final descController = useTextEditingController();
    _notifier = ref.read(myUserProvider.notifier);
    useEffect((){
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        () async {
          print("reload");
          await _notifier.reload();
        }();
      });
      return null;
    }, []);

    useEffect((){
      nameController.text = myUser.name;
      descController.text = myUser.desc;
      print("set myUser name/desc");
    }, [myUser.name, myUser.desc]);

    final onClickSave = (BuildContext context) async {
      await _notifier.updateUserNameDesc(nameController.text, descController.text);
      AlertDialogManager.showAlertDialog(context, "保存完了", "ユーザーの情報を保存しました");
    };

    final onClickUploadUserImage = (BuildContext context) async {
      try {
        print("onClickUploadUserImage");
        var image = await _picker.pickImage(
          source: ImageSource.gallery,
          maxHeight: 200,
          maxWidth: 200,
          imageQuality: 70,
        );
        print("pickImage");
        if (image == null) {
          // キャンセルされた場合
          return;
        }
        LoadingDialog.showLoading(context);
        final imageUrl = await _notifier.uploadImage(myUser.id ?? "", File(image.path));
        LoadingDialog.hideLoading(context);
        print("imageUrl = $imageUrl");
        if (imageUrl != null && imageUrl != "") {
          await _notifier.updateUserPhotoUrl(imageUrl);
          AlertDialogManager.showAlertDialog(context, "", "画像のアップロードが完了しました。");
        } else {
          AlertDialogManager.showAlertDialog(context, "エラー", "画像のアップロードに失敗しました。");
        }
      } catch (err) {
        print("Error ${err.toString()}" );
      }
    };

    final onClickEmail = (BuildContext context) async {
      String uuid = myUser.id ?? "";
      String nickname = myUser.name;
      final Email email = Email(
        body: '\n${nickname}:${uuid}\n',
        subject: '癒やしメモ問い合わせ',
        recipients: ['selfnote.appli@gmail.com'],
        cc: [],
        bcc: [],
        attachmentPaths: [],
        isHTML: false,
      );

      try {
        await FlutterEmailSender.send(email);
      } catch (e) {
        AlertDialogManager.showAlertDialog(context, "メーラーの起動に失敗しました", "メールの設定を行ってください");
      }
    };

    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(child: UserAvator(user: myUser, size: 100.0)),
                ElevatedButton(
                  child: Text("アイコン設定"),
                  onPressed: () => onClickUploadUserImage(context),
                ),
                Divider(),
                SpaceBox(height: 16.0),
                TextField(
                  controller: nameController,
                  maxLength: 16,
                  decoration: InputDecoration(
                      labelText: "ニックネーム",
                      hintText: "お名前を入力してください"
                  ),
                ),
                TextField(
                  controller: descController,
                  //maxLines: 2,
                  maxLength: 80,
                  //keyboardType: TextInputType.multiline,
                  //textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                      labelText: "自己紹介",
                      hintText: "自己紹介を入力してください"
                  ),
                ),
                ElevatedButton(
                  child: Text("保存する"),
                  onPressed: () => onClickSave(context),
                ),
                Divider(),
                SpaceBox(height: 16.0),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text("ステータス"),
                        Divider(),
                        Text("総合ポイント ${myUser.totalPoint}pt"),
                        SpaceBox(height: 12.0),
                        // Text("プロフィールの閲覧数 ${profileViewedCount}view"),
                        // SpaceBox(height: 12.0),
                        Text("いいね！された数 ${myUser.totalLikedCount}いいね！"),
                      ],
                    ),
                  ),
                ),
                Divider(),
                /*
                SpaceBox(height: 16.0),
                FlatButton(
                  child: Text("プロフィールコメント" + countStr),
                  onPressed: () => onClickProfileComment(context),
                  textColor: Theme.of(context).primaryColor,
                ),
                FlatButton(
                  child: Text("ブロック設定"),
                  onPressed: () => onClickBlock(context),
                  textColor: Theme.of(context).primaryColor,
                ),
                */
                FlatButton(
                  child: Text("ご意見/お問合せ"),
                  onPressed: () => onClickEmail(context),
                  textColor: Theme.of(context).primaryColor,
                ),
                /*
                FlatButton(
                  child: Text("アプリをレビューする"),
                  onPressed: () => onReview(context),
                  textColor: Theme.of(context).primaryColor,
                ),

                 */
              ],
            ),
          ),
        ),
      ],
    );
    /*
    return Center(
      child: Text("設定"),
    );
     */
  }
}
