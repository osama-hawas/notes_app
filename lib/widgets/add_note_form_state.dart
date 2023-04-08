import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import 'custom_botton.dart';
import 'custom_text_field.dart';
import 'list_view_colors.dart';

class AddNoteFormState extends StatefulWidget {
  const AddNoteFormState({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteFormState> createState() => _AddNoteFormStateState();
}

class _AddNoteFormStateState extends State<AddNoteFormState> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CustomListViewColor(),
          ),
          CustomTextField(
            hintText: title ?? 'Title',
            maxLine: 1,
            onSaved: (value) {
              title = value;
            },
          ),
          CustomTextField(
            hintText: subTitle ?? 'Content',
            maxLine: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButtom(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var noteModel = NoteModel(
                        subtitle: subTitle!,
                        color: Colors.blue.withAlpha(200).value,
                        date: DateTime.now().toString(),
                        title: title!);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                textButtom: 'Add',
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
