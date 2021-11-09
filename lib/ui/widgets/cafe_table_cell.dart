import 'package:flutter/material.dart';

class CafeTableCell extends StatelessWidget {
  final Map<String, Object> tableData;

  CafeTableCell({required this.tableData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.red),
      width: 140,
      child: Row(
        children: [
          Text("いす"),
          Text("テーブル"),
          Text("いす"),
        ],
      ),
    );
  }
}
