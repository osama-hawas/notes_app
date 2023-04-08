import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

import '../cubits/note_view_cubit/note_view_cubit.dart';
import 'add_note_form_state.dart';

Future<dynamic> showModelBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
    ),
    isScrollControlled: true,
    builder: (context) {
      return BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            BlocProvider.of<NoteViewCubit>(context).getAllNote();
            Navigator.pop(context);
          }

          if (state is AddNoteFailure) {
            print('Failed');
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const AddNoteFormState()),
            ),
          );
        },
      );
    },
  );
}
