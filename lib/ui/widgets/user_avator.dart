import 'package:flutter/material.dart';
import 'package:focus_cafe_flutter/data/models/user.dart';
import 'package:focus_cafe_flutter/ui/widgets/tapable_circle_image_avator.dart';

class UserAvator extends StatelessWidget {
  final User? user;
  final void Function(String)? onTap;
  final double? size; //Circle diameter
  final Color? backgroundColor;

  UserAvator({required this.user, this.onTap, this.size, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final anonymousUrl = "https://focus-cafe.space/user_anonymous.png";
    final photoUrl = user?.photoUrl == "/user_anonymous.png" ? anonymousUrl : user?.photoUrl;
    if (photoUrl == "") {
      return Container();
    }
    return TapableCircleImageAvator(id:user?.id ?? "", name:user?.name ?? "", imageUrl:photoUrl, onTap: onTap, size: size ?? 48, backgroundColor: backgroundColor ?? Color.fromRGBO(240, 240, 240, 0.9));
  }
}
