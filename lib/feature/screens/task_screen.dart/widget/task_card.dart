import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/core/model/task_model.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/screens/task_screen.dart/widget/task_status_chip.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
  });

  final TaskModel task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  bool get _isCompleted => task.isCompleted ?? false;

  String _timeAgo(DateTime? date) {
    if (date == null) return '';
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays == 1) return '1d ago';
    return '${diff.inDays}d ago';
  }

  String _formatDueDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final picked = DateTime(date.year, date.month, date.day);

    if (picked == today) return 'Today';
    if (picked == tomorrow) return 'Tomorrow';
    return DateFormat('MMM d').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: _isCompleted
            ? AppColors.secondaryBackground
            : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border.withAlpha(150),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: icon + title + menu
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Completion icon
                GestureDetector(
                  onTap: onToggle,
                  child: Container(
                    width: 26,
                    height: 26,
                    margin: const EdgeInsets.only(top: 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _isCompleted
                          ? AppColors.success
                          : Colors.transparent,
                      border: Border.all(
                        color: _isCompleted
                            ? AppColors.success
                            : AppColors.textHint,
                        width: 2,
                      ),
                    ),
                    child: _isCompleted
                        ? const Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
                const Gap(12),
                // Title
                Expanded(
                  child: Text(
                    task.taskTitle ?? 'Untitled Task',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16,
                      fontWeight: FontWeightHelper.semiBold,
                      color: _isCompleted
                          ? AppColors.textHint
                          : AppColors.textPrimary,
                      decoration: _isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                ),
                // Menu
                GestureDetector(
                  onTap: () => _showMenu(context),
                  child: const Icon(
                    Icons.more_vert,
                    size: 20,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            // Description
            if (task.taskDiscription != null &&
                task.taskDiscription!.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.only(left: 38, top: 4),
                child: Text(
                  task.taskDiscription!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ),
            ],
            const Gap(10),
            // Bottom row: chips + created time
            Padding(
              padding: const EdgeInsets.only(left: 38),
              child: Row(
                children: [
                  // Due date chip
                  if (task.reminderTime != null)
                    TaskStatusChip(
                      label: 'Due: ${_formatDueDate(task.reminderTime!)}',
                      icon: Icons.calendar_today_outlined,
                      backgroundColor:
                          AppColors.primaryLight.withAlpha(30),
                      iconColor: AppColors.primary,
                      textColor: AppColors.primaryDark,
                    ),
                  if (task.reminderTime != null &&
                      (task.hasReminder ?? false))
                    const Gap(6),
                  // Time chip
                  if (task.hasReminder ?? false)
                    TaskStatusChip(
                      label: task.reminderTime != null
                          ? DateFormat('h:mm a')
                              .format(task.reminderTime!)
                          : 'Reminder',
                      icon: Icons.access_time,
                      backgroundColor:
                          AppColors.accentLight.withAlpha(120),
                      iconColor: AppColors.accent,
                    ),
                  const Spacer(),
                  // Created time
                  if (task.createdAt != null)
                    Text(
                      'Created: ${_timeAgo(task.createdAt)}',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 11,
                        color: AppColors.textHint,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(
                  _isCompleted
                      ? Icons.replay
                      : Icons.check_circle_outline,
                  color: AppColors.primary,
                ),
                title: Text(
                  _isCompleted ? 'Mark as incomplete' : 'Mark as complete',
                ),
                onTap: () {
                  Navigator.pop(context);
                  onToggle();
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.delete_outline,
                  color: AppColors.error,
                ),
                title: const Text('Delete task'),
                onTap: () {
                  Navigator.pop(context);
                  onDelete();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
