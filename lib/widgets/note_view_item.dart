import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/note_view_cubit/note_view_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import '../views/edit_note_screen.dart';

class NoteViewItem extends StatelessWidget {
  const NoteViewItem({
    super.key,
    required this.noteModel,
  });

  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteScreen(
            noteModel: noteModel,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(noteModel.color)),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    noteModel.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        noteModel.delete();
                        BlocProvider.of<NoteViewCubit>(context).getAllNote();
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.black,
                        size: 28,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  noteModel.subtitle,
                  style: TextStyle(
                    color: Colors.black.withAlpha(150),
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 3,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat.yMd().format(DateTime.parse(noteModel.date)),
                    style: TextStyle(
                      color: Colors.black.withAlpha(150),
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
