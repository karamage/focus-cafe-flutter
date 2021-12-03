import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/ui/widgets/wrap_timer.dart';

class TextTimer extends StatelessWidget {
  final bool isStart;
  final int initTime;
  final void Function(int) onTimer;
  final void Function() onCompleted;

  TextTimer({
    required this.isStart,
    required this.initTime,
    required this.onTimer,
    required this.onCompleted
  });

  @override
  Widget build(BuildContext context) {
    final timerKey = GlobalObjectKey<WrapTimerState>(context);
    return WrapTimer(key: timerKey, child: buildTimer(context, timerKey), isStart: isStart, initTime: initTime, onTimer: onTimer, onCompleted: onCompleted);
  }

  Widget buildTimer(BuildContext context, GlobalObjectKey<WrapTimerState> timerKey) {
    final remainingTime = timerKey.currentState?.remainingTime ?? 0;
    print("_TextTimer buildTimer isStart=${isStart}");
    return Container(
      child: Text(
          timerKey.currentState?.getTimeStr(remainingTime) ?? "",
          style: TextStyle(fontSize: 20, color: Colors.blueAccent)
      ),
    );
  }
}

