import 'package:flutter/material.dart';

class AlertDialogManager {
  static showAlertDialog(BuildContext context, String title, String body) {
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () { Navigator.pop(context); },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  static showConfirmDialog(BuildContext context, String title, String body, String buttonTitle, Function? tapOk, dynamic argumaents, {bool isPop = true}) {
    Widget okButton = ElevatedButton(
      child: Text(buttonTitle),
      onPressed: () {
        if (tapOk != null && argumaents != null) {
          tapOk(argumaents);
        }
        if (isPop) {
          Navigator.pop(context);
        }
      },
    );

    Widget cancelButton = ElevatedButton(
      child: Text("キャンセル"),
      onPressed: () { Navigator.pop(context); },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(body),
              ]
          )
      ),
      //content: Text(body),
      actions: [
        okButton,
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
