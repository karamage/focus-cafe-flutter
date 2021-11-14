import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:focus_cafe_flutter/ui/widgets/cafe_chair.dart';
import 'package:focus_cafe_flutter/ui/widgets/cafe_table.dart';

class CafeTableCell extends StatelessWidget {
  final Map<String, Object> tableData;
  final List<RestUser> restUsers;

  CafeTableCell({required this.tableData, required this.restUsers});

  @override
  Widget build(BuildContext context) {
    final tableId = tableData["id"] as int;
    final chairs = tableData["chairs"]! as List<Map<String, Object>>;
    final leftChairId = chairs[0]["id"] as int;
    final leftUser = restUsers.firstWhere((user) => user.chairId == leftChairId);
    final rightChairId = chairs[1]["id"] as int;
    final rightUser = restUsers.firstWhere((user) => user.chairId == rightChairId);
    return Container(
      decoration: BoxDecoration(color: Colors.red),
      width: 180,
      child: Row(
        children: [
          CafeChair(chairData: chairs[0], imagePath: "TODO", restUser: leftUser),
          CafeTable(id: tableId),
          CafeChair(chairData: chairs[1], imagePath: "TODO", restUser: rightUser),
        ],
      ),
    );
  }
}
