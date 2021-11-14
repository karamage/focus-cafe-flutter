import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:focus_cafe_flutter/ui/widgets/cafe_table_cell.dart';

final cafeTables = [
  { "id": 1, "chairs": [{ "id": 11 }, { "id": 12 }] },
  { "id": 2, "chairs": [{ "id": 21 }, { "id": 22 }] },
  { "id": 3, "chairs": [{ "id": 31 }, { "id": 32 }] },
  { "id": 4, "chairs": [{ "id": 41 }, { "id": 42 }] },
  { "id": 5, "chairs": [{ "id": 51 }, { "id": 52 }] },
  { "id": 6, "chairs": [{ "id": 61 }, { "id": 62 }] },
  { "id": 7, "chairs": [{ "id": 71 }, { "id": 72 }] },
  { "id": 8, "chairs": [{ "id": 81 }, { "id": 82 }] },
];
// ignore: must_be_immutable
class CafeteracePane extends StatelessWidget {
  final List<RestUser> restUsers;
  CafeteracePane({
    required this.restUsers,
  }) {
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(230, 230, 230, 1.0)),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: buildContents(context),
    );
  }

  Widget buildContents(BuildContext context) {
    return Wrap(
      children: <CafeTableCell>[
        ...cafeTables.map((tableData) {
          return CafeTableCell(tableData: tableData, restUsers: restUsers,);
        }).toList()
      ],
    );
  }
}
