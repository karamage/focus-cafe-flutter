import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/notification.dart' as FocusCafeNotification;
import 'package:focus_cafe_flutter/ui/widgets/user_avator.dart';
import 'package:focus_cafe_flutter/util/app_router.dart';
import 'package:focus_cafe_flutter/util/date_util.dart';

class NotificationCell extends StatelessWidget {
  final FocusCafeNotification.Notification item;

  NotificationCell({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: ValueKey(item.id),
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: item.isReaded ? Color.fromRGBO(220, 220, 220, 1.0) : Colors.white,
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
    return ListTile(
      onTap: () {
        pushToNavigator(context);
      },
      leading: UserAvator(user: item.fromUser),
      title: Text(item.body),
      trailing: Text(DateUtil.mmdd(item.createdAt)),
    );
  }

  Future<void> pushToNavigator(BuildContext context) async {
    Navigator.pushNamed(context, AppRouter.profileRoute, arguments: [item.fromUser?.id ?? ""]);
  }
}
