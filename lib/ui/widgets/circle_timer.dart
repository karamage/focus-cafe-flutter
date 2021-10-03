import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Timer? timer;

class CircleTimer extends StatefulWidget {
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
  _CircleTimerState createState() => _CircleTimerState();
}

class _CircleTimerState extends State<CircleTimer> {
  int remainingTime = 0;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.initTime;
  }

  void _onTimer(Timer timer) {
    final nextTime = remainingTime - 1;
    widget.onTimer(nextTime);
    setState(() {
      remainingTime = nextTime;
    });

    // 完了
    if (nextTime <= 0) {
      _stopTimer();
      widget.onCompleted();
    }
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), _onTimer);
  }

  void _stopTimer() {
    timer?.cancel();
    timer = null;
    setState(() {
      remainingTime = widget.initTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("_CircleTimerState build isStart=${widget.isStart} percent=${remainingTime / widget.initTime}");
    if (widget.isStart && timer == null) {
      _startTimer();
    } else if (!widget.isStart) {
      _stopTimer();
    }

    var percent = remainingTime / widget.initTime;
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

