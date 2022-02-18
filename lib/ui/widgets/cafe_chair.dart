import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/rest_user.dart';
import 'package:focus_cafe_flutter/ui/widgets/user_avator_cell.dart';
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
      decoration: BoxDecoration(
        // TODO
        // color: Colors.blue,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
        )
      ),
      width: 60,
      height: 60,
      child: restUser == null ?
        buildRestButton()
        : Center(child: UserAvatorCell(user: restUser?.user, size: 36))
    );
  }
  Widget buildRestButton() {
    return !isFocus ? Center(
      child: SizedBox(
        width: 56,
        height: 20,
        child: ElevatedButton(
          child: Text(
            "休む",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue.withOpacity(0.6), //ボタンの背景色
          ),
          onPressed: () {
            onSitChair(chairData["id"] as int);
          },
        ),
      ),
    ) : Container();
  }
}
