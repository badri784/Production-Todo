import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pro_todo/feature/screens/task_screen.dart/add_task_screen/widget/reminder_card.dart';
import 'package:pro_todo/feature/screens/task_screen.dart/add_task_screen/widget/task_description_field.dart';
import 'package:pro_todo/feature/screens/task_screen.dart/add_task_screen/widget/task_title_field.dart';
import 'package:pro_todo/feature/widget/date_picker_row.dart';

class AddTaskForm extends StatelessWidget {
  const AddTaskForm({
    super.key,
    required this.formKey,
    required this.taskTitleController,
    required this.taskDescriptionController,
    required this.selectedDate,
    required this.formattedDate,
    required this.hasReminder,
    required this.onPickDate,
    required this.onClearDate,
    required this.onReminderChanged,
    required this.onPickTime,
    this.timeMassage,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController taskTitleController;
  final TextEditingController taskDescriptionController;
  final DateTime? selectedDate;
  final String? formattedDate;
  final bool hasReminder;
  final VoidCallback onPickDate;
  final VoidCallback onClearDate;
  final ValueChanged<bool> onReminderChanged;
  final VoidCallback onPickTime;
  final String? timeMassage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TaskTitleField(controller: taskTitleController),
            const Gap(8),
            TaskDescriptionField(controller: taskDescriptionController),
            const Gap(8),
            DatePickerRow(
              selectedDate: selectedDate,
              formattedDate: formattedDate,
              onTap: onPickDate,
              onClear: onClearDate,
            ),
            const Gap(8),
            ReminderCard(
              hasReminder: hasReminder,
              onReminderChanged: onReminderChanged,
              onPickTime: onPickTime,
              timeMassage: timeMassage,
            ),
          ],
        ),
      ),
    );
  }
}
