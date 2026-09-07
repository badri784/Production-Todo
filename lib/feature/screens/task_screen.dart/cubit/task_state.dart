part of 'task_cubit.dart';

sealed class TaskState {
  const TaskState();
}

final class TaskInitial extends TaskState {}

final class TaskLoading extends TaskState {}

final class TaskSuccess extends TaskState {
  final List<TaskModel> taskModelList;
  const TaskSuccess({required this.taskModelList});

}

final class TaskError extends TaskState {
  final String message;
  const TaskError({required this.message});

}
