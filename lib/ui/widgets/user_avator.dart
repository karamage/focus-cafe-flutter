import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/ui/widgets/tapable_circle_image_avator.dart';
//import 'package:tapable_circle_image_avator/tapable_circle_image_avator.dart';

class UserAvator extends StatelessWidget {
  final User? user;
  final void Function(String)? onTap;

  UserAvator({required this.user, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TapableCircleImageAvator(id:user?.id ?? "", name:user?.name ?? "", imageUrl:user?.photoUrl, onTap: onTap);
    //return Text(user?.name ?? "");
  }
}
