import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants/strings.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  List<NoteModel>? noteModel;
  Color color = Color(0xffb1b695);

  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      note.color = color.value;
      Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      noteModel = notesBox.values.toList(growable: true);

      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errMessage: e.toString()));
    }
  }
}
