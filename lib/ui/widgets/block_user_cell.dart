import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/block_user.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/data/providers/block_users_provider.dart';
import 'package:focus_cafe_flutter/data/providers/my_user_provider.dart';
import 'package:focus_cafe_flutter/ui/widgets/user_avator.dart';
import 'package:focus_cafe_flutter/util/alert_dialog_manager.dart';
import 'package:focus_cafe_flutter/util/date_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BlockUserCell extends HookConsumerWidget {
  final BlockUser item;

  BlockUserCell({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      key: ValueKey(item.id),
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(color: Color.fromRGBO(230, 230, 230, 1.0))
          ),
        ),
        child: _buildContents(context, ref),
      ),
    );
  }

  Widget _buildContents(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildMainContents(context, ref),
        ],
      ),
    );
  }

  Widget _buildMainContents(BuildContext context, WidgetRef ref) {
    final user = User(id: item.id, name: item.name, photoUrl: item.photoUrl);
    return ListTile(
      onTap: () {
        final tapOk = (args) {
          // 解除
          final myUser = ref.watch(myUserProvider);
          final notifier = ref.read(blockUsersProvider.notifier);
          notifier.deleteBlockUser(myUser.id!, user);
        };
        // ブロックを削除するか確認
        AlertDialogManager.showConfirmDialog(context, "ブロックの解除", "このユーザー(${item.name})のブロックを解除してよろしいですか?", "解除する", tapOk, []);
      },
      leading: UserAvator(user: user),
      title: Text(item.name),
      trailing: Text(DateUtil.mmdd(item.createdAt)),
    );
  }
}

