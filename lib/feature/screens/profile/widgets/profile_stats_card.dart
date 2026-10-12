import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/theme/app_colors.dart';

class ProfileStatsCard extends StatelessWidget {
  final int completedTasks;
  final int pendingTasks;
  final int totalNotes;

  const ProfileStatsCard({
    super.key,
    required this.completedTasks,
    required this.pendingTasks,
    required this.totalNotes,
  });

  int get totalTasks => completedTasks + pendingTasks;

  int get completionRate {
    if (totalTasks == 0) return 0;
    return ((completedTasks / totalTasks) * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.insights_rounded,
                      size: 16,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Productivity Overview',
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.bolt_rounded,
                      size: 14,
                      color: AppColors.accent,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$completionRate% Done',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: totalTasks == 0 ? 0 : (completionRate / 100),
              minHeight: 6,
              backgroundColor: AppColors.secondaryBackground,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
          const SizedBox(height: 16),
          // 3 Stat pillars
          Row(
            children: [
              Expanded(
                child: _buildMetricItem(
                  icon: Icons.check_circle_rounded,
                  iconColor: AppColors.success,
                  count: '$completedTasks',
                  label: 'Completed',
                ),
              ),
              Container(
                height: 36,
                width: 1,
                color: AppColors.border,
              ),
              Expanded(
                child: _buildMetricItem(
                  icon: Icons.pending_actions_rounded,
                  iconColor: AppColors.accent,
                  count: '$pendingTasks',
                  label: 'In Progress',
                ),
              ),
              Container(
                height: 36,
                width: 1,
                color: AppColors.border,
              ),
              Expanded(
                child: _buildMetricItem(
                  icon: Icons.auto_stories_rounded,
                  iconColor: AppColors.primary,
                  count: '$totalNotes',
                  label: 'Notes',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem({
    required IconData icon,
    required Color iconColor,
    required String count,
    required String label,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: iconColor),
            const SizedBox(width: 6),
            Text(
              count,
              style: GoogleFonts.nunitoSans(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: GoogleFonts.nunitoSans(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
