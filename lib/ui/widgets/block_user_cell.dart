import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/block_user.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/ui/widgets/user_avator.dart';
import 'package:focus_cafe_flutter/util/date_util.dart';

class BlockUserCell extends StatelessWidget {
  final BlockUser item;

  BlockUserCell({required this.item});

  @override
  Widget build(BuildContext context) {
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
        child: _buildContents(context),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildMainContents(context),
        ],
      ),
    );
  }

  Widget _buildMainContents(BuildContext context) {
    // NotificationsModel itemsModel = Provider.of<NotificationsModel>(context);
    final user = User(id: item.id, name: item.name, photoUrl: item.photoUrl);
    return ListTile(
      onTap: () {
        // ブロックを削除するか確認
      },
      // leading: Text(item.fromUser.nickname),
      leading: UserAvator(user: user),
      title: Text(item.name),
      trailing: Text(DateUtil.mmdd(item.createdAt)),
    );
  }
}

