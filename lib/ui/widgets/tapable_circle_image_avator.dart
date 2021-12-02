import 'package:flutter/material.dart';

class TapableCircleImageAvator extends StatelessWidget {
  final String id;
  final String name;
  final String? imageUrl;
  final double size; //Circle diameter
  final void Function(String)? onTap;
  final Color backgroundColor;

  TapableCircleImageAvator({required this.id, required this.name, this.imageUrl,
    required this.size, this.onTap, this.backgroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!(id);
      }, // handle your image tap here
      child: CircleAvatar(
        radius: size / 2,
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        child: imageUrl != null ?
        ClipOval(
          child: Image.network(
              imageUrl ?? "",
              height: size,
              width: size,
              fit: BoxFit.cover),
        )
            :Text(name.length > 0 ? name[0]:""),
      ),
    );
  }
}