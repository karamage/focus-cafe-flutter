import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:focus_cafe_flutter/data/models/focus_user.dart';
import 'package:focus_cafe_flutter/ui/widgets/focus_user_cell.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class WorkingPane extends HookConsumerWidget {
  final List<FocusUser> focusUsers;
  final void Function(Timer timer) onTimer;
  Timer? timer;
  WorkingPane({
    required this.focusUsers,
    required this.onTimer,
  }) {}

  void _onTimer(Timer timer) {
    print("WorkingPane _onTimer");
    onTimer(timer);
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 2), _onTimer);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect((){
      print("WorkingPane onMount");
      _startTimer();
    }, []);
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
        ...focusUsers.map((user) {
          return user.user != null ? FocusUserCell(focusUser: user):Container();
        }).toList()
        , focusUsers.length == 0 ? Text("集中しているユーザーがいません") : Container()
      ],
    );
  }
}
