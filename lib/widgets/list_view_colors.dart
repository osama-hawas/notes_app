import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

import '../constants/strings.dart';
import 'custom_circle_avatar.dart';

class CustomListViewColor extends StatefulWidget {
  CustomListViewColor({super.key});

  @override
  State<CustomListViewColor> createState() => _CustomListViewColorState();
}

class _CustomListViewColorState extends State<CustomListViewColor> {
  int? colorIndex;
 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 8, end: 8, top: 4, bottom: 0),
            child: GestureDetector(
                onTap: () {
                  colorIndex = index;
                  BlocProvider.of<AddNoteCubit>(context).color = kListOfColor[index];
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

