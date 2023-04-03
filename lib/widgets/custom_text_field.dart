

import 'package:flutter/material.dart';

import '../constants/strings.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int maxLine;

  const CustomTextField({required this.hintText, required this.maxLine});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
      child: TextField(
        cursorColor: textFieldColor,
        cursorHeight: 20,
        maxLines: maxLine,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: outLineInputBorder(),
          border: outLineInputBorder(),
          focusedBorder: outLineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder outLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: textFieldColor,
      ),
    );
  }
}
