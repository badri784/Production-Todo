import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/theme/app_colors.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool showDivider;
  final bool isDestructive;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.iconColor,
    this.iconBackgroundColor,
    this.trailing,
    this.onTap,
    this.showDivider = true,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveIconColor = isDestructive
        ? AppColors.error
        : (iconColor ?? AppColors.primary);

    final effectiveBgColor = isDestructive
        ? AppColors.error.withValues(alpha: 0.1)
        : (iconBackgroundColor ?? AppColors.primary.withValues(alpha: 0.08));

    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(14),
            splashColor: (isDestructive ? AppColors.error : AppColors.primary)
                .withValues(alpha: 0.1),
            highlightColor: (isDestructive ? AppColors.error : AppColors.primary)
                .withValues(alpha: 0.05),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: effectiveBgColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      size: 22,
                      color: effectiveIconColor,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: isDestructive
                                ? AppColors.error
                                : AppColors.textPrimary,
                          ),
                        ),
                        if (subtitle != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            subtitle!,
                            style: GoogleFonts.nunitoSans(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (trailing != null)
                    trailing!
                  else if (onTap != null)
                    const Icon(
                      Icons.chevron_right_rounded,
                      size: 20,
                      color: AppColors.textHint,
                    ),
                ],
              ),
            ),
          ),
        ),
        if (showDivider)
          Padding(
            padding: const EdgeInsets.only(left: 70, right: 14),
            child: Divider(
              height: 1,
              thickness: 0.8,
              color: AppColors.border.withValues(alpha: 0.6),
            ),
          ),
      ],
    );
  }
}
