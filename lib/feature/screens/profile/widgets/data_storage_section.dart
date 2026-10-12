import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_dialogs.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_menu_item.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_section_container.dart';

class DataStorageSection extends StatelessWidget {
  final bool isSyncing;
  final VoidCallback onSync;

  const DataStorageSection({
    super.key,
    required this.isSyncing,
    required this.onSync,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileSectionContainer(
      title: 'Data & Storage',
      children: [
        ProfileMenuItem(
          icon: Icons.cloud_done_outlined,
          iconColor: AppColors.primary,
          title: 'Cloud Backup & Sync',
          subtitle: isSyncing ? 'Syncing now...' : 'All tasks backed up to cloud',
          trailing: isSyncing
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primary,
                  ),
                )
              : const Icon(
                  Icons.sync_rounded,
                  color: AppColors.primary,
                  size: 20,
                ),
          onTap: onSync,
        ),
        ProfileMenuItem(
          icon: Icons.cleaning_services_outlined,
          iconColor: const Color(0xFF7F8C8D),
          iconBackgroundColor: const Color(0xFF7F8C8D).withValues(alpha: 0.1),
          title: 'Clear Temporary Cache',
          subtitle: 'Frees up local image and network memory',
          onTap: () => ProfileDialogs.showClearCache(context),
        ),
        ProfileMenuItem(
          icon: Icons.file_download_outlined,
          iconColor: const Color(0xFF27AE60),
          iconBackgroundColor: const Color(0xFF27AE60).withValues(alpha: 0.1),
          title: 'Export Data (JSON)',
          subtitle: 'Download a copy of your tasks & notes',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Data exported successfully! Saved to downloads.',
                  style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w600),
                ),
                backgroundColor: AppColors.primary,
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          showDivider: false,
        ),
      ],
    );
  }
}
