import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/focus_user.dart';
import 'package:focus_cafe_flutter/ui/widgets/user_avator.dart';

// ignore: must_be_immutable
class WorkingPane extends StatelessWidget {
  final List<FocusUser> focusUsers;
  WorkingPane({
    required this.focusUsers,
  }) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(230, 230, 230, 1.0)),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: buildContents(context),
    );
  }

  Widget buildContents(BuildContext context) {
    return Wrap(
      children: <Widget>[
        ...focusUsers.map((user) {
          return user.user != null ? UserAvator(user: user.user):Container();
        }).toList()
        , focusUsers.length == 0 ? Text("集中しているユーザーがいません") : Container()
      ],
    );
  }
}
