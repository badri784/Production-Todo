import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/core/theme/app_colors.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.onCancel,
    required this.onSave,
  });

  final VoidCallback onCancel;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onCancel,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: AppColors.border),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text(
              'Cancel',
              style: GoogleFonts.nunitoSans(
                fontSize: 15,
                fontWeight: FontWeightHelper.semiBold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
        const Gap(12),
        Expanded(
          flex: 2,
          child: ElevatedButton.icon(
            onPressed: onSave,
            icon: const Icon(Icons.check_circle, size: 20),
            label: Text(
              'Save Note',
              style: GoogleFonts.nunitoSans(
                fontSize: 15,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
