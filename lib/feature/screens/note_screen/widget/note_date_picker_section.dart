import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/widget/date_picker_row.dart';

class NoteDatePickerSection extends StatefulWidget {
  const NoteDatePickerSection({
    super.key,
    required this.onDateChanged,
    this.selectedDate,
  });

  final ValueChanged<DateTime?> onDateChanged;
  final DateTime? selectedDate;

  @override
  State<NoteDatePickerSection> createState() => _NoteDatePickerSectionState();
}

class _NoteDatePickerSectionState extends State<NoteDatePickerSection> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate;
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
      widget.onDateChanged(picked);
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return DatePickerRow(
      selectedDate: _selectedDate,
      formattedDate: _selectedDate != null ? _formatDate(_selectedDate!) : null,
      onTap: _pickDate,
      onClear: () {
        setState(() {
          _selectedDate = null;
        });
        widget.onDateChanged(null);
      },
    );
  }
}
