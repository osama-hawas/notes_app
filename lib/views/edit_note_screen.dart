import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:notes_app/widgets/custom_text_field.dart';

import '../widgets/custom_abb_bar.dart';

class EditNoteScreen extends StatelessWidget {
 const EditNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                CustomAppBar(
                  textTitle: 'Edit Note',
                  iconButton: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check,
                        size: 28,
                      )),
                )
              ];
            },
            body: Column(
              children: [
                CustomTextField(hintText: 'Title', maxLine: 1),
                CustomTextField(hintText: 'Content', maxLine: 5),
              ],
            )));
  }
}
