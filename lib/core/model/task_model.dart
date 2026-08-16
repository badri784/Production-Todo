import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String? noteId;
  final String? noteTitle;
  final String? noteDiscription;
  final DateTime? createdAt;

  const TaskModel({
    this.noteId,
    this.noteTitle,
    this.noteDiscription,
    this.createdAt,
  });

  @override
  List<Object?> get props => [noteId, noteTitle, noteDiscription, createdAt];
}
