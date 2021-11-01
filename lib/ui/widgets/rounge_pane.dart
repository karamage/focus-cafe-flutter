import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:focus_cafe_flutter/ui/widgets/user_avator.dart';

// ignore: must_be_immutable
class RoungePane extends StatelessWidget {
  final List<RestUser> restUsers;
  RoungePane({
    required this.restUsers,
  }) {
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      //constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        /*
        border: Border(
            bottom: BorderSide(color: Color.fromRGBO(230, 230, 230, 1.0))
        ),
         */
        border: Border.all(color: Color.fromRGBO(230, 230, 230, 1.0)),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: buildContents(context),
    );
  }

  Widget buildContents(BuildContext context) {
    return Wrap(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ...restUsers.map((user) {
          return user.user != null ? UserAvator(user: user.user):Container();
        }).toList()
      ],
    );
  }
}
