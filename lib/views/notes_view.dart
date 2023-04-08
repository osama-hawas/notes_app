import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/models/note_model.dart';

import '../constants/strings.dart';
import '../cubits/note_view_cubit/note_view_cubit.dart';
import '../widgets/custom_abb_bar.dart';
import '../widgets/custom_floating_action_button.dart';
import '../widgets/note_view_item.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            CustomAppBar(
              textTitle: 'Notes',
              iconButton: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 28,
                ),
              ),
            )
          ];
        },
        body: BlocBuilder<NoteViewCubit, NoteViewState>(
          builder: (context, state) {
            List<NoteModel> notes =
                Hive.box<NoteModel>(kNotesBox).values.toList();
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: Hive.box<NoteModel>(kNotesBox).values.length,
              clipBehavior: Clip.none,
              itemBuilder: (contex, index) {
                return NoteViewItem(
                  noteModel: notes[index],
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}



//  