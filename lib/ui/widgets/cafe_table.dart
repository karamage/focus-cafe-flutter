import 'package:flutter/material.dart';

class CafeTable extends StatelessWidget {
  final int id;

  CafeTable({required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.yellow),
        width: 40,
        height: 40,
        child: Center(
          child: Image.asset(
            'images/cafe-table.jpg',
            fit: BoxFit.contain
          )
        )
    );
  }
}
