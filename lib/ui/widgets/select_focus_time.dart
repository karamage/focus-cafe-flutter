import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/util/constants.dart';

final timeList = [
  10,
  1 * 60,
  3 * 60,
  5 * 60,
  10 * 60,
  15 * 60,
  25 * 60,
  50 * 60,
  90 * 60,
];

class SelectFocusTime extends StatefulWidget {
  final void Function(int)? onChanged;

  SelectFocusTime({required this.onChanged});

  @override
  _SelectFocusTimeState createState() => _SelectFocusTimeState();
}

class _SelectFocusTimeState extends State<SelectFocusTime> {
  List<DropdownMenuItem<int>> _items = [];
  int _selectItem = INIT_FOCUS_TIME_SEC;

  @override
  void initState() {
    super.initState();
    setItems();
    _selectItem = INIT_FOCUS_TIME_SEC;
  }

  String getTimeStr(int sec) {
    return sec >= 60 ? '${(sec / 60).floor()}分':'${sec}秒';
  }

  void setItems() {
    timeList.forEach((sec) {
      _items.add(DropdownMenuItem(
          child: Text(getTimeStr(sec), style: TextStyle(fontSize: 20.0),),
          value: sec,
        ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<int>(
        items: _items,
        value: _selectItem,
        underline: SizedBox(),
        iconSize: 24,
        onChanged: widget.onChanged != null ? (value) {
          if (value != null) {
            setState(() {
              _selectItem = value;
            });
            this.widget.onChanged!(value);
          }
        } : null,
      ),
    );
  }
}