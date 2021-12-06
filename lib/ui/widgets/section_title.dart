import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.bold
      ),
    );
  }
}
