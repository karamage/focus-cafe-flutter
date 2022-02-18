import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/ui/widgets/user_avator.dart';
import 'package:focus_cafe_flutter/util/app_router.dart';

class UserAvatorCell extends StatelessWidget {
  final User? user;
  final double? size; //Circle diameter
  final Color? backgroundColor;

  UserAvatorCell({required this.user, this.size, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final onTap = (String userId) {
      Navigator.pushNamed(context, AppRouter.profileRoute, arguments: [userId]);
    };
    return UserAvator(user: user, onTap: onTap, size: this.size, backgroundColor: this.backgroundColor);
  }
}
