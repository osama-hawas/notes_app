import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

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
                icon: Icon(
                  Icons.search,
                  size: 28,
                ),
              ),
            )
          ];
        },
        body: GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          clipBehavior: Clip.none,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 1.7),
          itemBuilder: (contex, index) {
            return NoteViewItem();
          },
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(),
    );
  }
}
