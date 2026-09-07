import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String taskId;
  @HiveField(1)
  final String? taskTitle;
  @HiveField(2)
  final String? taskDiscription;
  @HiveField(3)
  final DateTime? createdAt;
  @HiveField(4)
  final bool? hasReminder;
  @HiveField(5)
  final DateTime? reminderTime;
  @HiveField(6)
  final bool? isCompleted;

  TaskModel({
    String? taskId,
    this.taskTitle,
    this.taskDiscription,
    this.createdAt,
    this.hasReminder,
    this.reminderTime,
    this.isCompleted,
  }) : taskId = taskId ?? const Uuid().v4();
}
