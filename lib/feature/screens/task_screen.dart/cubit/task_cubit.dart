import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_todo/core/model/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  final List<TaskModel> taskModelList = [];

  void loadTasks() {
    emit(TaskSuccess(taskModelList: List.from(taskModelList)));
  }

  void saveTask(TaskModel taskModel) {
    try {
      emit(TaskLoading());
      taskModelList.add(taskModel);
      emit(TaskSuccess(taskModelList: List.from(taskModelList)));
    } catch (e) {
      emit(TaskError(message: e.toString()));
    }
  }

  void toggleTask(String taskId) {
    try {
      final index = taskModelList.indexWhere((t) => t.taskId == taskId);
      if (index == -1) return;
      final task = taskModelList[index];
      taskModelList[index] = TaskModel(
        taskId: task.taskId,
        taskTitle: task.taskTitle,
        taskDiscription: task.taskDiscription,
        createdAt: task.createdAt,
        hasReminder: task.hasReminder,
        reminderTime: task.reminderTime,
        isCompleted: !(task.isCompleted ?? false),
      );
      emit(TaskSuccess(taskModelList: List.from(taskModelList)));
    } catch (e) {
      emit(TaskError(message: e.toString()));
    }
  }

  void deleteTask(String taskId) {
    try {
      taskModelList.removeWhere((t) => t.taskId == taskId);
      emit(TaskSuccess(taskModelList: List.from(taskModelList)));
    } catch (e) {
      emit(TaskError(message: e.toString()));
    }
  }
}
