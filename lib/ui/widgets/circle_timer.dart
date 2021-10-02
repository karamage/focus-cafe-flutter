import 'dart:async';

import 'package:flutter/material.dart';

class CircleTimer extends StatefulWidget {
  bool isStart;
  int initTime;
  //final void Function(int)? onChanged;
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
  Timer? timer;

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
      widget.onCompleted();
      _stopTimer();
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
    print("_CircleTimerState build isStart=${widget.isStart}");
    if (widget.isStart && timer == null) {
      _startTimer();
    } else if (!widget.isStart) {
      _stopTimer();
    }
    return Text("Circle Timer ${widget.isStart} ${remainingTime}");
    /*
    return DropdownButton<int>(
      items: _items,
      value: _selectItem,
      onChanged: widget.onChanged != null ? (value) {
        if (value != null) {
          setState(() {
            _selectItem = value;
          });
          this.widget.onChanged!(value);
        }
      } : null,
    );
    */
  }
}
