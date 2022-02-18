import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/focus_user.dart';
import 'package:focus_cafe_flutter/ui/widgets/space_box.dart';
import 'package:focus_cafe_flutter/ui/widgets/user_avator_cell.dart';

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
    final remainingTime = focusUser.remainingTime ?? focusUser.focusTime;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        UserAvatorCell(user: focusUser.user),
        SpaceBox.height(1),
        Text(
          getTimeStr(remainingTime),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        Text(
          "${focusUser.todayCount}ポモ目",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.black26,
          ),
        ),
      ],
    );
  }
}

String getTimeStr(int totalsec) {
  final minutes = (totalsec / 60).floor();
  final sec = (totalsec % 60).floor();
  return "${minutes.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}";
}
