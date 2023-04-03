import 'package:flutter/material.dart';

import '../constants/strings.dart';
import 'custom_text_field.dart';

Future<dynamic> showModelBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
    ),
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CustomTextField(
                hintText: 'title',
                maxLine: 1,
              ),
              CustomTextField(hintText: 'content', maxLine: 5),
              CustomButtom(
                onTap: () {},
                textButtom: 'Add',
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      );
    },
  );
}

class CustomButtom extends StatelessWidget {
  VoidCallback? onTap;
  String textButtom;
  CustomButtom({required this.textButtom, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 64, right: 64, top: 32),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: textFieldColor,
          ),
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
              textButtom,
              style: TextStyle(
                color: Color(0xff2b475e),
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
