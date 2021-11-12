import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/ui/widgets/cafe_chair.dart';
import 'package:focus_cafe_flutter/ui/widgets/cafe_table.dart';

class CafeTableCell extends StatelessWidget {
  final Map<String, Object> tableData;

  CafeTableCell({required this.tableData});

  @override
  Widget build(BuildContext context) {
    final tableId = tableData["id"] as int;
    final chairs = tableData["chairs"]! as List<Map<String, Object>>;
    return Container(
      decoration: BoxDecoration(color: Colors.red),
      width: 140,
      child: Row(
        children: [
          CafeChair(chairData: chairs[0], imagePath: "TODO", restUser: null),
          CafeTable(id: tableId),
          CafeChair(chairData: chairs[1], imagePath: "TODO", restUser: null),
        ],
      ),
    );
  }
}
