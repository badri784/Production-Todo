import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_dialogs.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_menu_item.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_section_container.dart';

class SupportCommunitySection extends StatelessWidget {
  const SupportCommunitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileSectionContainer(
      title: 'Support & Community',
      children: [
        ProfileMenuItem(
          icon: Icons.help_outline_rounded,
          iconColor: const Color(0xFF2980B9),
          iconBackgroundColor: const Color(0xFF2980B9).withValues(alpha: 0.1),
          title: 'Help Center & FAQ',
          subtitle: 'Learn how to use AI notes and tasks',
          onTap: () => ProfileDialogs.showHelp(context),
        ),
        ProfileMenuItem(
          icon: Icons.share_outlined,
          iconColor: const Color(0xFF8E44AD),
          iconBackgroundColor: const Color(0xFF8E44AD).withValues(alpha: 0.1),
          title: 'Share ProTodo with Friends',
          subtitle: 'Invite coworkers & friends to boost productivity',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Share link copied to clipboard!',
                  style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w600),
                ),
                backgroundColor: AppColors.primary,
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
        ProfileMenuItem(
          icon: Icons.star_outline_rounded,
          iconColor: AppColors.accent,
          iconBackgroundColor: AppColors.accent.withValues(alpha: 0.15),
          title: 'Rate ProTodo',
          subtitle: 'Give us a 5-star rating on the App Store',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Thank you for your rating and support! ⭐⭐⭐⭐⭐',
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
