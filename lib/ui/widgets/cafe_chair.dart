import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:focus_cafe_flutter/ui/widgets/user_avator.dart';

class CafeChair extends StatelessWidget {
  final Map<String, Object> chairData;
  final String imagePath;
  final RestUser? restUser;

  CafeChair({required this.chairData, required this.imagePath, required this.restUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      child: SizedBox(
        width: 60,
        height: 20,
        child: restUser == null ? ElevatedButton(
          child: Text(
            "休憩",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          onPressed: () {
            // TODO
            print("onPressed");
          },
        ) : UserAvator(user: restUser?.user),
      )
    );
  }
}
