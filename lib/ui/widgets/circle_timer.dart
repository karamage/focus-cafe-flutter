import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/ui/widgets/wrap_timer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircleTimer extends StatelessWidget {
  final bool isStart;
  final int initTime;
  final void Function(int) onTimer;
  final void Function() onCompleted;

  CircleTimer({
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
    print("_CircleTimer buildTimer isStart=${isStart} percent=${remainingTime / initTime}");
    var percent = remainingTime / initTime;
    if (percent > 1.0) {
      percent = 1.0;
    }
    return CircularPercentIndicator(
      radius: 240.0,
      lineWidth: 16.0,
      percent: percent,
      center: Text(
          getTimeStr(remainingTime),
          style: TextStyle(fontSize: 32, color: Colors.blueAccent)
      ),
      progressColor: Colors.blueAccent,
    );
  }
}

String getTimeStr(int totalSec) {
  final minutes = (totalSec / 60).floor();
  final sec = (totalSec % 60).floor();
  return "${minutes.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")}";
}
