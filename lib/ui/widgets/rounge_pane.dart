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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromRGBO(230, 230, 230, 1.0))
          ),
          //borderRadius: BorderRadius.circular(5.0),
        ),
        child: buildContents(context),
      ),
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
