import 'package:flutter/material.dart';

class BottomSheetDialog {
  static Future<void> showBottomSheet(BuildContext context, List<String> labels, void Function(String) callback) async {
    List<Widget> widgets = labels.map((label) => ListTile(
      title: Text(label),
      onTap: () => callback(label),
    )).toList();
    await showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: widgets,
            )
        );
      },
    );
  }

  static hideBottomSheet(BuildContext context) {
    NavigatorState navState = Navigator.of(context);
    navState.pop();
  }
}
