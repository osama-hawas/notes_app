import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';

import 'package:notes_app/widgets/custom_text_field.dart';

import '../cubits/note_view_cubit/note_view_cubit.dart';
import '../widgets/custom_abb_bar.dart';
import '../widgets/custom_edit_note_list_view_color.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            CustomAppBar(
              textTitle: 'Edit Note',
              iconButton: IconButton(
                  onPressed: () {
                    widget.noteModel.title = title ?? widget.noteModel.title;
                    widget.noteModel.subtitle =
                        subTitle ?? widget.noteModel.subtitle;
                    widget.noteModel.save();
                    BlocProvider.of<NoteViewCubit>(context).getAllNote();
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.check,
                    size: 28,
                  )),
            )
          ];
        },
        body: Column(
          children: [
            CustomTextField(
                onChanged: (value) {
                  title = value;
                },
                hintText: widget.noteModel.title.isNotEmpty
                    ? widget.noteModel.title
                    : 'Title',
                maxLine: 1,
                onSaved: (value) {}),
            CustomTextField(
                onChanged: (value) {
                  subTitle = value;
                },
                hintText: widget.noteModel.subtitle.isNotEmpty
                    ? widget.noteModel.subtitle
                    : 'Content',
                maxLine: 5,
                onSaved: (value) {}),
            CustomEditNoteListViewColor(noteModel: widget.noteModel),
          ],
        ),
      ),
    );
  }
}
