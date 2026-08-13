import 'package:equatable/equatable.dart';

class NoteModel extends Equatable {
  final String? noteId;
  final String? noteTitle;
  final String? noteDiscription;
  final DateTime? createdAt;

  const NoteModel({
    this.noteId,
    this.noteTitle,
    this.noteDiscription,
    this.createdAt,
  });

  @override
  List<Object?> get props => [noteId, noteTitle, noteDiscription, createdAt];
}
