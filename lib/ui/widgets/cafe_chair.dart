import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';

class CafeChair extends StatelessWidget {
  final Map<String, Object> chairData;
  final String imagePath;
  final RestUser? restUser;

  CafeChair({required this.chairData, required this.imagePath, required this.restUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      child: Text("いす")
    );
  }
}
