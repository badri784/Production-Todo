import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class TaskModel extends Equatable {
  final String noteId;
  final String? noteTitle;
  final String? noteDiscription;
  final DateTime? createdAt;
  final DateTime? dueDate;
  final bool? hasReminder;
  final DateTime? reminderTime;
  final bool? isCompleted;

  TaskModel({
    String? noteId,
    this.noteTitle,
    this.noteDiscription,
    this.createdAt,
    this.dueDate,
    this.hasReminder,
    this.reminderTime,
    this.isCompleted,
  }) : noteId = noteId ?? const Uuid().v4();

  @override
  List<Object?> get props => [
    noteId,
    noteTitle,
    noteDiscription,
    createdAt,
    dueDate,
    hasReminder,
    reminderTime,
    isCompleted,
  ];
}
