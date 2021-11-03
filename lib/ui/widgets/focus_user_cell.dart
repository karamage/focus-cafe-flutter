import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/done.dart';
import 'package:focus_cafe_flutter/data/models/focus_user.dart';
import 'package:focus_cafe_flutter/ui/widgets/like_button.dart';
import 'package:focus_cafe_flutter/ui/widgets/space_box.dart';
import 'package:focus_cafe_flutter/ui/widgets/user_avator.dart';
import 'package:focus_cafe_flutter/util/date_util.dart';

// ignore: must_be_immutable
class FocusUserCell extends StatelessWidget {
  final FocusUser focusUser;
  FocusUserCell({
    required this.focusUser,
  }) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: ValueKey("FocusUser-" + (focusUser.id ?? "")),
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
      child: Container(
        child: buildContents(context),
      ),
    );
  }

  Widget buildContents(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        UserAvator(user: focusUser.user),
        SpaceBox.height(2),
        Text(getTimeStr(focusUser.remainingTime)),
      ],
    );
  }
}

String getTimeStr(int totalsec) {
  final minutes = (totalsec / 60).floor();
  final sec = (totalsec % 60).floor();
  return "${minutes.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}";
}
