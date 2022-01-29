import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/data/providers/notifications_provider.dart';
import 'package:focus_cafe_flutter/ui/notifiers/my_user_notifier.dart';
import 'package:focus_cafe_flutter/ui/widgets/space_box.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingScreen extends HookConsumerWidget {
  late MyUserNotifier _notifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationsProvider);
    final myUser = ref.watch(myUserProvider);
    final nameController = useTextEditingController();
    final descController = useTextEditingController();
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

    final onClick = (BuildContext context) => {
    };

    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                /*
                Center(child: UserAvator(nickname: nameController.text, imageUrl: imageUrl, size: 100.0)),
                ElevatedButton(
                  child: Text("アイコン設定"),
                  onPressed: () => onClickUploadUserImage(context),
                ),
                Divider(),
                SpaceBox(height: 16.0),
                */
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
                  onPressed: () => onClick(context),
                ),
                /*
                Divider(),
                SpaceBox(height: 16.0),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text("ステータス"),
                        Divider(),
                        Text("癒やしポイント ${totalPoint}pt"),
                        SpaceBox(height: 12.0),
                        Text("プロフィールの閲覧数 ${profileViewedCount}view"),
                        SpaceBox(height: 12.0),
                        Text("いいね！された数 ${totalLikedCount}いいね！"),
                      ],
                    ),
                  ),
                ),
                Divider(),
                 */
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
                FlatButton(
                  child: Text("ご意見/お問合せ"),
                  onPressed: () => onClickEmail(context),
                  textColor: Theme.of(context).primaryColor,
                ),
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
