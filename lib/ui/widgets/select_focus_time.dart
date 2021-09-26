import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/util/constants.dart';

class SelectFocusTime extends StatefulWidget {
  final void Function(int) onChanged;

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

  void setItems() {
    _items
      ..add(DropdownMenuItem(
        child: Text('1分', style: TextStyle(fontSize: 20.0),),
        value: 60,
      ))
      ..add(DropdownMenuItem(
        child: Text('3分', style: TextStyle(fontSize: 20.0),),
        value: 60 * 3,
      ))
      ..add(DropdownMenuItem(
        child: Text('25分', style: TextStyle(fontSize: 20.0),),
        value: 60 * 25,
      ));
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      items: _items,
      value: _selectItem,
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _selectItem = value;
          });
          this.widget.onChanged(value);
        }
      },
    );
  }
}