import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_todo/core/helpers/extension.dart';
import 'package:pro_todo/core/routing/routes.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/screens/task_screen.dart/cubit/task_cubit.dart';
import 'package:pro_todo/feature/screens/task_screen.dart/widget/empty_task_view.dart';
import 'package:pro_todo/feature/screens/task_screen.dart/widget/task_list.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: TaskCubit()..loadTasks(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              backgroundColor: AppColors.primary,
              onPressed: () async {
                final cubit = context.read<TaskCubit>();
                await context.pushnamed(
                  Routes.addTaskScreen,
                  arguments: cubit,
                );
              },
              child: const Icon(Icons.add, color: Colors.white),
            );
          },
        ),
        appBar: AppBar(
          title: const Text('My Tasks'),
          backgroundColor: AppColors.background,
          elevation: 0,
        ),
        body: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            if (state is TaskLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is TaskSuccess) {
              if (state.taskModelList.isEmpty) {
                return const EmptyTaskView();
              }
              return TaskList(
                tasks: state.taskModelList,
                onToggle: (taskId) {
                  context.read<TaskCubit>().toggleTask(taskId);
                },
                onDelete: (taskId) {
                  context.read<TaskCubit>().deleteTask(taskId);
                },
              );
            }
            return const EmptyTaskView();
          },
        ),
      ),
    );
  }
}
