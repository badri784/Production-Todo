import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/screens/profile/widgets/edit_profile_bottom_sheet.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_dialogs.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_menu_item.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_section_container.dart';

class AccountSecuritySection extends StatelessWidget {
  final User? user;
  final VoidCallback onProfileUpdated;

  const AccountSecuritySection({
    super.key,
    required this.user,
    required this.onProfileUpdated,
  });

  @override
  Widget build(BuildContext context) {
    final isEmailVerified = user?.emailVerified ?? false;
    final displayName = user?.displayName ?? '';
    final email = user?.email ?? 'guest@protodo.app';

    return ProfileSectionContainer(
      title: 'Account & Security',
      trailingBadge: isEmailVerified
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Verified',
                style: GoogleFonts.nunitoSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppColors.success,
                ),
              ),
            )
          : null,
      children: [
        ProfileMenuItem(
          icon: Icons.badge_outlined,
          iconColor: AppColors.primary,
          title: 'Edit Personal Details',
          subtitle: 'Update your display name & bio',
          onTap: () {
            EditProfileBottomSheet.show(
              context,
              currentName: displayName,
              currentEmail: email,
              onProfileUpdated: onProfileUpdated,
            );
          },
        ),
        ProfileMenuItem(
          icon: Icons.lock_reset_rounded,
          iconColor: const Color(0xFFE67E22),
          iconBackgroundColor: const Color(0xFFE67E22).withValues(alpha: 0.1),
          title: 'Change Password',
          subtitle: 'Send password reset link to your email',
          onTap: () => ProfileDialogs.showPasswordReset(context, user?.email),
        ),
        ProfileMenuItem(
          icon: Icons.mark_email_read_outlined,
          iconColor: isEmailVerified ? AppColors.success : AppColors.textSecondary,
          title: 'Email Verification',
          subtitle: isEmailVerified
              ? 'Email is verified'
              : 'Tap to verify your email address',
          trailing: isEmailVerified
              ? const Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.success,
                  size: 20,
                )
              : TextButton(
                  onPressed: () async {
                    try {
                      await user?.sendEmailVerification();
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Verification email sent! Check your inbox.',
                          ),
                          backgroundColor: AppColors.primary,
                        ),
                      );
                    } catch (e) {
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Could not send email: $e'),
                          backgroundColor: AppColors.error,
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Verify',
                    style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ),
          showDivider: false,
        ),
      ],
    );
  }
}
