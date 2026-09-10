import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pro_todo/core/model/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  final List<TaskModel> taskModelList = [];
  static const String taskBoxName = 'task';
  final taskBox = Hive.box<TaskModel>(taskBoxName);
  void loadNote() {
    try {
      emit(TaskLoading());
      final loadedTask = taskBox.values.toList();
      taskModelList.addAll(loadedTask);
      emit(TaskSuccess(taskModelList: List.from(taskModelList)));
    } catch (massage) {
      emit(TaskError(message: massage.toString()));
    }
  }

  void saveTask(TaskModel taskModel) {
    try {
      emit(TaskLoading());
      taskModelList.add(taskModel);
      taskBox.put(taskModel.taskId, taskModel);
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
      taskBox.delete(taskId);
      emit(TaskSuccess(taskModelList: List.from(taskModelList)));
    } catch (e) {
      emit(TaskError(message: e.toString()));
    }
  }
}
