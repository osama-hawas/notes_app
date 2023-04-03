import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
   CustomAppBar({super.key, required this.textTitle, required this.iconButton});
  final String textTitle;
  final IconButton iconButton;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      snap: true,
      backgroundColor: Colors.grey.withAlpha(0),
      title:  Text(textTitle,
        
        style: TextStyle(fontSize: 24),
      ),
      actions: [
       iconButton
      ],
    );
  }
}
