import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/Simple_bloc_observer.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/views/notes_view.dart';
import 'constants/strings.dart';
import 'cubits/note_view_cubit/note_view_cubit.dart';
import 'models/note_model.dart';

void main() async {
  try {
    await Hive.initFlutter();
    Bloc.observer = SimpleBlocObserver();

    Hive.registerAdapter(NoteModelAdapter());
    await Hive.openBox<NoteModel>(kNotesBox);
  } catch (e) {
    print(e.toString());
  }

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit()),
        BlocProvider(create: (context) => NoteViewCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const NotesView(),
      ),
    );
  }
}
