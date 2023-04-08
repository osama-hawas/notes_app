import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants/strings.dart';

part 'note_view_state.dart';

class NoteViewCubit extends Cubit<NoteViewState> {
  NoteViewCubit() : super(NoteViewInitial());
  List<NoteModel>? notes;
  getAllNote() {
    Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(RefreshSuccess());
  }
}
