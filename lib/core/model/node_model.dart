import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'node_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String noteId;
  @HiveField(1)
  final String? noteTitle;
  @HiveField(2)
  final String? noteDescription;
  @HiveField(3)
  final DateTime? createdAt;

  NoteModel({
    String? noteId,
    this.noteTitle,
    this.noteDescription,
    this.createdAt,
  }) : noteId = noteId ?? const Uuid().v4();
}
