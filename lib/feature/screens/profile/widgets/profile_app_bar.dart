import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/theme/app_colors.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onRefresh;
  final VoidCallback onSync;
  final bool isSyncing;

  const ProfileAppBar({
    super.key,
    required this.onRefresh,
    required this.onSync,
    this.isSyncing = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'My Profile',
        style: GoogleFonts.nunitoSans(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimary,
        ),
      ),
      centerTitle: false,
      backgroundColor: AppColors.background,
      elevation: 0,
      actions: [
        IconButton(
          tooltip: 'Refresh Profile',
          onPressed: onRefresh,
          icon: const Icon(Icons.refresh_rounded, color: AppColors.primary),
        ),
        IconButton(
          tooltip: 'Sync with Cloud',
          onPressed: isSyncing ? null : onSync,
          icon: isSyncing
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primary,
                  ),
                )
              : const Icon(
                  Icons.cloud_sync_outlined,
                  color: AppColors.primary,
                ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
