import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:focus_cafe_flutter/ui/widgets/user_avator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CafeChair extends HookConsumerWidget {
  final Map<String, Object> chairData;
  final String imagePath;
  final RestUser? restUser;
  final Function(int) onSitChair;
  final bool isFocus;
  CafeChair({
    required this.chairData,
    required this.imagePath,
    required this.restUser,
    required this.onSitChair,
    required this.isFocus
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      child: SizedBox(
        width: 60,
        height: 20,
        child: restUser == null ?
          buildRestButton()
          : UserAvator(user: restUser?.user),
      )
    );
  }
  Widget buildRestButton() {
    return !isFocus ? ElevatedButton(
      child: Text(
        "休憩",
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      onPressed: () {
        onSitChair(chairData["id"] as int);
      },
    ) : Container();
  }
}
