import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/screens/profile/widgets/delete_account_dialog.dart';
import 'package:pro_todo/feature/screens/profile/widgets/logout_confirmation_sheet.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_menu_item.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_section_container.dart';

class DangerZoneSection extends StatelessWidget {
  const DangerZoneSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileSectionContainer(
          title: 'Account Actions',
          children: [
            ProfileMenuItem(
              icon: Icons.logout_rounded,
              isDestructive: true,
              title: 'Log Out',
              subtitle: 'Sign out of this device safely',
              onTap: () => LogoutConfirmationSheet.show(context),
            ),
            ProfileMenuItem(
              icon: Icons.delete_forever_rounded,
              isDestructive: true,
              title: 'Delete Account',
              subtitle: 'Permanently remove your account and data',
              onTap: () => DeleteAccountDialog.show(context),
              showDivider: false,
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Prominent Standalone Log Out Button
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.error.withValues(alpha: 0.08),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ElevatedButton.icon(
            onPressed: () => LogoutConfirmationSheet.show(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.surface,
              foregroundColor: AppColors.error,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 15),
              side: BorderSide(
                color: AppColors.error.withValues(alpha: 0.35),
                width: 1.2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            icon: const Icon(
              Icons.logout_rounded,
              size: 20,
              color: AppColors.error,
            ),
            label: Text(
              'Log Out from ProTodo',
              style: GoogleFonts.nunitoSans(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AppColors.error,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
