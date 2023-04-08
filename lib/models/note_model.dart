import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
   String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  late String date;
  @HiveField(3)
   int color;

  NoteModel({
    required this.subtitle,
    required this.color,
    required this.date,
    required this.title,
  });
}
