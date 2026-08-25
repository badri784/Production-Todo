import 'package:flutter/material.dart';
import 'package:pro_todo/core/model/task_model.dart';
import 'package:pro_todo/feature/screens/task_screen.dart/widget/task_card.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasks,
    required this.onToggle,
    required this.onDelete,
  });

  final List<TaskModel> tasks;
  final void Function(String taskId) onToggle;
  final void Function(String taskId) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 80),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskCard(
          task: task,
          onToggle: () => onToggle(task.taskId),
          onDelete: () => onDelete(task.taskId),
        );
      },
    );
  }
}
