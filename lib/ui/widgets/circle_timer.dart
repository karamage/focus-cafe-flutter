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
    int remainingTime = timerKey.currentState?.remainingTime ?? 0;

    // 選択したタイマー時間が切り替わった場合
    if (!isStart) {
      timerKey.currentState?.resetTimer();
      remainingTime = initTime;
    }

    return WrapTimer(key: timerKey, child: buildTimer(context, timerKey, remainingTime), isStart: isStart, initTime: initTime, onTimer: onTimer, onCompleted: onCompleted);
  }

  Widget buildTimer(BuildContext context, GlobalObjectKey<WrapTimerState> timerKey, int remainingTime) {
    print("_CircleTimer buildTimer isStart=${isStart} percent=${remainingTime / initTime}");
    var percent = remainingTime / initTime;
    if (percent > 1.0) {
      percent = 1.0;
    }
    return CircularPercentIndicator(
      radius: 240.0,
      lineWidth: 20.0,
      percent: percent,
      center: Text(
          timerKey.currentState?.getTimeStr(remainingTime) ?? "",
          style: TextStyle(fontSize: 38, color: Colors.white, fontWeight: FontWeight.bold)
      ),
      progressColor: Colors.white,
    );
  }
}

