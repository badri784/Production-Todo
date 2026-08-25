import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pro_todo/core/model/task_model.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/screens/task_screen.dart/cubit/task_cubit.dart';
import 'package:pro_todo/feature/screens/task_screen.dart/add_task_screen/widget/add_task_form.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime? _selectedDate;
  bool _hasReminder = false;
  final _formKey = GlobalKey<FormState>();
  final _taskTitleController = TextEditingController();
  final _taskDescriptionController = TextEditingController();

  @override
  void dispose() {
    _taskTitleController.dispose();
    _taskDescriptionController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final picked = DateTime(date.year, date.month, date.day);

    if (picked == today) return 'Today';
    if (picked == tomorrow) return 'Tomorrow';
    return DateFormat('MMM d, yyyy').format(date);
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              secondary: AppColors.accent,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  void _onSave() {
    if (!_formKey.currentState!.validate()) return;
    context.read<TaskCubit>().saveTask(
      TaskModel(
        taskTitle: _taskTitleController.text,
        taskDiscription: _taskDescriptionController.text,
        hasReminder: _hasReminder,
        isCompleted: false,
        createdAt: DateTime.now(),
        reminderTime: _selectedDate,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: _onSave,
              icon: const Icon(Icons.done_outline),
            ),
          ),
        ],
        title: const Text('New Task'),
      ),
      body: BlocListener<TaskCubit, TaskState>(
        listener: (context, state) {
          if (state is TaskError) {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Error'),
                content: Text(state.message),
              ),
            );
          }
        },
        child: AddTaskForm(
          formKey: _formKey,
          taskTitleController: _taskTitleController,
          taskDescriptionController: _taskDescriptionController,
          selectedDate: _selectedDate,
          formattedDate: _selectedDate != null
              ? _formatDate(_selectedDate!)
              : null,
          hasReminder: _hasReminder,
          onPickDate: _pickDate,
          onClearDate: () => setState(() => _selectedDate = null),
          onReminderChanged: (val) => setState(() => _hasReminder = val),
          onPickTime: () {
           showDialog(
              context: context,
              builder: (context) => TimePickerDialog(
                  initialTime: TimeOfDay.now(),
                  confirmText: 'Confirmed',
                  cancelText: 'Now',
                  initialEntryMode: TimePickerEntryMode.input,
                ),
            );
          },
        ),
      ),
    );
  }
}
