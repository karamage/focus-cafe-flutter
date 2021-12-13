import 'package:flutter/material.dart';

class WhiteAppBar {
  static PreferredSizeWidget build(String title, [List<Widget>? actions]) {
    return AppBar(
      title: title == "集中タイマー" ? Image.asset(
        'assets/images/header_logo.png',
        fit: BoxFit.contain,
        width: 180,
        height: 76,
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
