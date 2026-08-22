import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class TaskModel extends Equatable {
  final String taskId;
  final String? taskTitle;
  final String? taskDiscription;
  final DateTime? createdAt;
  final DateTime? dueDate;
  final bool? hasReminder;
  final DateTime? reminderTime;
  final bool? isCompleted;

  TaskModel({
    String? taskId,
    this.taskTitle,
    this.taskDiscription,
    this.createdAt,
    this.dueDate,
    this.hasReminder,
    this.reminderTime,
    this.isCompleted,
  }) : taskId = taskId ?? const Uuid().v4();

  @override
  List<Object?> get props => [
    taskId,
    taskTitle,
    taskDiscription,
    createdAt,
    dueDate,
    hasReminder,
    reminderTime,
    isCompleted,
  ];
}
