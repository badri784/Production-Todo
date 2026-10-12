import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/theme/app_colors.dart';

class ProfileSectionContainer extends StatelessWidget {
  final String title;
  final Widget? trailingBadge;
  final List<Widget> children;

  const ProfileSectionContainer({
    super.key,
    required this.title,
    this.trailingBadge,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Row(
            children: [
              Text(
                title.toUpperCase(),
                style: GoogleFonts.nunitoSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.9,
                  color: AppColors.textSecondary,
                ),
              ),
              if (trailingBadge != null) ...[
                const SizedBox(width: 8),
                trailingBadge!,
              ],
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
