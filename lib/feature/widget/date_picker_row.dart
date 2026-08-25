import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/core/theme/app_colors.dart';

class DatePickerRow extends StatelessWidget {
  const DatePickerRow({
    super.key,
    required this.selectedDate,
    required this.formattedDate,
    required this.onTap,
    required this.onClear,
  });

  final DateTime? selectedDate;
  final String? formattedDate;
  final VoidCallback onTap;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 20,
              color: selectedDate != null
                  ? AppColors.primary
                  : AppColors.textHint,
            ),
            const Gap(10),
            Text(
              formattedDate ?? 'Pick a due date',
              style: GoogleFonts.nunitoSans(
                fontSize: 15,
                fontWeight: FontWeightHelper.medium,
                color: selectedDate != null
                    ? AppColors.textPrimary
                    : AppColors.textHint,
              ),
            ),
            const Spacer(),
            if (selectedDate != null)
              GestureDetector(
                onTap: onClear,
                child: const Icon(
                  Icons.close,
                  size: 18,
                  color: AppColors.textSecondary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
