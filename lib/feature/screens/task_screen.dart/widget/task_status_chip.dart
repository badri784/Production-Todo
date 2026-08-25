import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/theme/app_colors.dart';

class TaskStatusChip extends StatelessWidget {
  const TaskStatusChip({
    super.key,
    required this.label,
    required this.icon,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
  });

  final String label;
  final IconData icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.accentLight.withAlpha(120),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: iconColor ?? AppColors.accent,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: GoogleFonts.nunitoSans(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: textColor ?? AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
