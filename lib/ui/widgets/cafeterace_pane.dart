import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:focus_cafe_flutter/ui/widgets/user_avator.dart';

// ignore: must_be_immutable
class CafeteracePane extends StatelessWidget {
  final List<RestUser> restUsers;
  CafeteracePane({
    required this.restUsers,
  }) {
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
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
        ...restUsers.map((user) {
          return user.user != null ? UserAvator(user: user.user):Container();
        }).toList()
      ],
    );
  }
}
