part of 'task_cubit.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TaskInitial extends TaskState {}

final class TaskLoading extends TaskState {}

final class TaskSuccess extends TaskState {
  final List<TaskModel> taskModelList;
  const TaskSuccess({required this.taskModelList});

  @override
  List<Object> get props => [taskModelList];
}

final class TaskError extends TaskState {
  final String message;
  const TaskError({required this.message});

  @override
  List<Object> get props => [message];
}
