import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';

import '../constants/strings.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import 'custom_circle_avatar.dart';

class CustomEditNoteListViewColor extends StatefulWidget {
  CustomEditNoteListViewColor({super.key, required this.noteModel});
  NoteModel noteModel;

  @override
  State<CustomEditNoteListViewColor> createState() =>
      _CustomEditNoteListViewColorState();
}

class _CustomEditNoteListViewColorState
    extends State<CustomEditNoteListViewColor> {
  late int colorIndex;

  @override
  void initState() {
    colorIndex = kListOfColor.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 12, end: 4, top: 16, bottom: 0),
            child: GestureDetector(
                onTap: () {
                  colorIndex = index;
                  widget.noteModel.color = kListOfColor[index].value;
                  setState(() {});
                },
                child: CustomCircleAvatar(
                  isActive: colorIndex == index,
                  color: kListOfColor[index],
                )),
          );
        },
        itemCount: kListOfColor.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
