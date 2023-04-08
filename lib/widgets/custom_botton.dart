import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';

class CustomButtom extends StatelessWidget {
  VoidCallback? onTap;
  String textButtom;
  final bool isLoading;
  CustomButtom(
      {required this.textButtom, required this.onTap, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 64, right: 64, top: 32),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: kPrimiryColor,
          ),
          width: double.infinity,
          height: 50,
          child: Center(
            child: isLoading
                ?const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : Text(
                    textButtom,
                    style:const TextStyle(
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
