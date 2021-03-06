import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:focus_cafe_flutter/ui/widgets/cafe_chair.dart';
import 'package:focus_cafe_flutter/ui/widgets/cafe_table.dart';
import 'package:collection/collection.dart';

class CafeTableCell extends StatelessWidget {
  final Map<String, Object> tableData;
  final List<RestUser> restUsers;
  final Function(int) onSitChair;
  final bool isFocus;

  CafeTableCell({required this.tableData, required this.restUsers, required this.onSitChair, required this.isFocus});

  @override
  Widget build(BuildContext context) {
    final tableId = tableData["id"] as int;
    final chairs = tableData["chairs"]! as List<Map<String, Object>>;
    final leftChairId = chairs[0]["id"] as int;
    final leftUser = restUsers.firstWhereOrNull((user) => user.chairId == leftChairId);
    final rightChairId = chairs[1]["id"] as int;
    final rightUser = restUsers.firstWhereOrNull((user) => user.chairId == rightChairId);
    return Container(
      //decoration: BoxDecoration(color: Colors.red),
      width: 160,
      child: Row(
        children: [
          CafeChair(chairData: chairs[0], imagePath: "assets/images/left-chair.jpg", restUser: leftUser, onSitChair: onSitChair, isFocus: isFocus),
          CafeTable(id: tableId),
          CafeChair(chairData: chairs[1], imagePath: "assets/images/right-chair.jpg", restUser: rightUser, onSitChair: onSitChair, isFocus: isFocus),
        ],
      ),
    );
  }
}
