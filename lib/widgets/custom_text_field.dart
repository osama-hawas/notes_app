import 'package:flutter/material.dart';

import '../constants/strings.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int maxLine;
  void Function(String?)? onSaved;
  CustomTextField(
      {required this.hintText,
      required this.maxLine,
      required this.onSaved,
      this.onChanged});
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field is requird';
          } else {
            return null;
          }
        },
        cursorColor: kPrimiryColor,
        cursorHeight: 20,
        maxLines: maxLine,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
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
      borderSide: const BorderSide(
        color: kPrimiryColor,
      ),
    );
  }
}
