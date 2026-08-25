import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pro_todo/core/theme/app_colors.dart';

class ReminderCard extends StatelessWidget {
  const ReminderCard({
    super.key,
    required this.hasReminder,
    required this.onReminderChanged,
    required this.onPickTime,
    this.timeMassage,
  });

  final bool hasReminder;
  final ValueChanged<bool> onReminderChanged;
  final VoidCallback onPickTime;
  final String? timeMassage;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: ListTile(
        title: const Text('Set Reminder'),
        leading: const CircleAvatar(
          backgroundColor: Color(0xffe6e8e4),
          child: Icon(Icons.notifications_none, color: AppColors.primary),
        ),
        trailing: Switch(value: hasReminder, onChanged: onReminderChanged),
        subtitle: GestureDetector(
          onTap: onPickTime,
          child: Row(
            children: [
              const Icon(Icons.access_time),
              const Gap(5),
              Text(timeMassage ?? 'Pick A Time'),
            ],
          ),
        ),
      ),
    );
  }
}
