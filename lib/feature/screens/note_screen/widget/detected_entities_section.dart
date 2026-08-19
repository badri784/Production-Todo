import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/core/theme/app_colors.dart';

class DetectedEntitiesSection extends StatelessWidget {
  const DetectedEntitiesSection({
    super.key,
    required this.titleText,
    required this.formattedDate,
  });

  final String titleText;
  final String? formattedDate;

  @override
  Widget build(BuildContext context) {
    if (titleText.isEmpty && formattedDate == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DETECTED ENTITIES',
          style: GoogleFonts.nunitoSans(
            fontSize: 11,
            fontWeight: FontWeightHelper.semiBold,
            color: AppColors.textSecondary,
            letterSpacing: 1.2,
          ),
        ),
        const Gap(10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            if (titleText.isNotEmpty)
              EntityChip(
                icon: Icons.task_alt,
                label: titleText,
                color: AppColors.accent,
              ),
            if (formattedDate != null)
              EntityChip(
                icon: Icons.access_time,
                label: formattedDate!,
                color: AppColors.accent,
              ),
          ],
        ),
        const Gap(20),
      ],
    );
  }
}

/// A small chip widget for displaying detected entities.
class EntityChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const EntityChip({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const Gap(6),
          Text(
            label,
            style: GoogleFonts.nunitoSans(
              fontSize: 13,
              fontWeight: FontWeightHelper.semiBold,
              color: color.withValues(alpha: 0.85),
            ),
          ),
        ],
      ),
    );
  }
}
