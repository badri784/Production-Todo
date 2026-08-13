import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final String? todoId;
  final String? todoTitle;
  final String? todoDescription;
  final DateTime? createdAt;
  final bool? hasReminder;
  final DateTime? reminderTime;
  final bool? isCompleted;
  const TodoModel({
    this.hasReminder,
    this.reminderTime,
    this.todoId,
    this.todoTitle,
    this.todoDescription,
    this.createdAt,
    this.isCompleted,
  });

  @override
  List<Object?> get props => [
    todoId,
    todoTitle,
    todoDescription,
    createdAt,
    hasReminder,
    reminderTime,
    isCompleted,
  ];
}
