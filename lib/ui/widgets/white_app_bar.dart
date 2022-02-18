import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/ui/widgets/user_avator_cell.dart';

class WhiteAppBar {
  static PreferredSizeWidget build(String title, UserAvatorCell? avator, [List<Widget>? actions]) {
    return AppBar(
      leading: avator,
      title: title == "集中タイマー" ? Image.asset(
        'assets/images/header_logo.png',
        fit: BoxFit.contain,
        width: 192,
        height: 82,
      ) :
      Text(title,
        style: TextStyle(color: Colors.grey)
      ),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      actions: actions,
      iconTheme: IconThemeData(color: Colors.grey),
    );
  }
}
