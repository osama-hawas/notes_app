import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    Key? key,
    required this.isActive,
    required this.color,
  }) : super(key: key);
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            child: CircleAvatar(
              backgroundColor: color,
              radius: 27,
            ),
            radius: 30,
            backgroundColor: Colors.white,
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 30,
          );
  }
}
