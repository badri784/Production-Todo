import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class NoteModel extends Equatable {
  final String noteId;
  final String? noteTitle;
  final String? noteDescription;
  final DateTime? createdAt;

  NoteModel({
    String? noteId,
    this.noteTitle,
    this.noteDescription,
    this.createdAt,
  }) : noteId = noteId ?? const Uuid().v4();

  @override
  List<Object?> get props => [noteId, noteTitle, noteDescription, createdAt];
}
