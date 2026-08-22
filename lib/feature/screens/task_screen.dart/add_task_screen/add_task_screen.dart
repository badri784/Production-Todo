import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/widget/date_picker_row.dart';
import 'package:pro_todo/feature/widget/custom_text_form_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime? _selectedDate;

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final picked = DateTime(date.year, date.month, date.day);

    if (picked == today) {
      return 'Today';
    } else if (picked == tomorrow) {
      return 'Tomorrow';
    } else {
      return DateFormat('MMM d, yyyy').format(date);
    }
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
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool value = false;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.done_outline),
            ),
          ),
        ],
        title: const Text('New Task'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextFormField(
              maxLines: 2,
              maxlenght: 50,
              hintText: 'Task Title: ',
              outLienBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const Gap(8),
            CustomTextFormField(
              maxLines: 5,
              maxlenght: 500,
              hintText: 'Task Description: ',
              outLienBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const Gap(8),
            DatePickerRow(
              selectedDate: _selectedDate,
              formattedDate: _selectedDate != null
                  ? _formatDate(_selectedDate!)
                  : null,
              onTap: _pickDate,
              onClear: () {
                setState(() {
                  _selectedDate = null;
                });
              },
            ),
            const Gap(8),
            Card.outlined(
              child: ListTile(
                title: const Text('Set Reminder'),
                leading: const CircleAvatar(
                  backgroundColor: Color(0xffe6e8e4),
                  child: Icon(
                    Icons.notifications_none,
                    color: AppColors.primary,
                  ),
                ),
                trailing: Switch(
                  value: value,
                  onChanged: (val) {
                    setState(() {
                      value = val;
                    });
                  },
                ),
                subtitle: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return TimePickerDialog(initialTime: TimeOfDay.now());
                      },
                    );
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.access_time),
                      Gap(5),
                      Text('Pick A Time'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
