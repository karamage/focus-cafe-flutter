import 'dart:async';

import 'package:flutter/material.dart';

class CircleTimer extends StatefulWidget {
  bool isStart;
  int initTime;
  //final void Function(int)? onChanged;
  final void Function(int) onTimer;

  CircleTimer({
    required this.isStart,
    required this.initTime,
    required this.onTimer
  });

  @override
  _CircleTimerState createState() => _CircleTimerState();
}

class _CircleTimerState extends State<CircleTimer> {
  //List<DropdownMenuItem<int>> _items = [];
  //int _selectItem = INIT_FOCUS_TIME_SEC;
  int remainingTime = 0;
  Timer? timer = null;

  @override
  void initState() {
    super.initState();
    setItems();
    print("_CircleTimerState initState");
    //_selectItem = INIT_FOCUS_TIME_SEC;
    remainingTime = widget.initTime;
  }

  void setItems() {
    /*
    timeList.forEach((sec) {
      _items.add(DropdownMenuItem(
        child: Text('${(sec / 60).floor()}分', style: TextStyle(fontSize: 20.0),),
        value: sec,
      ));
    });
     */
  }
  void _onTimer(Timer timer) {
    widget.onTimer(remainingTime - 1);
    setState(() {
      remainingTime = remainingTime - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("_CircleTimerState build isStart=${widget.isStart}");
    if (widget.isStart && timer == null) {
      timer = Timer.periodic(const Duration(seconds: 1), _onTimer);
    } else if (!widget.isStart) {
      timer?.cancel();
      timer = null;
      setState(() {
        remainingTime = widget.initTime;
      });
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
