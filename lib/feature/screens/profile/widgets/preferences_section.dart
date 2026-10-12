import 'package:flutter/material.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_dialogs.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_menu_item.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_section_container.dart';

class PreferencesSection extends StatelessWidget {
  final bool notificationsEnabled;
  final bool darkModeEnabled;
  final bool hapticsEnabled;
  final String selectedLanguage;
  final ValueChanged<bool> onNotificationsChanged;
  final ValueChanged<bool> onDarkModeChanged;
  final ValueChanged<bool> onHapticsChanged;
  final ValueChanged<String> onLanguageChanged;

  const PreferencesSection({
    super.key,
    required this.notificationsEnabled,
    required this.darkModeEnabled,
    required this.hapticsEnabled,
    required this.selectedLanguage,
    required this.onNotificationsChanged,
    required this.onDarkModeChanged,
    required this.onHapticsChanged,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileSectionContainer(
      title: 'Preferences',
      children: [
        ProfileMenuItem(
          icon: Icons.notifications_active_outlined,
          iconColor: const Color(0xFF2980B9),
          iconBackgroundColor: const Color(0xFF2980B9).withValues(alpha: 0.1),
          title: 'Push Notifications',
          subtitle: 'Daily task reminders and smart updates',
          trailing: Switch.adaptive(
            value: notificationsEnabled,
            activeTrackColor: AppColors.primary,
            onChanged: onNotificationsChanged,
          ),
        ),
        ProfileMenuItem(
          icon: darkModeEnabled
              ? Icons.dark_mode_rounded
              : Icons.light_mode_outlined,
          iconColor: const Color(0xFF8E44AD),
          iconBackgroundColor: const Color(0xFF8E44AD).withValues(alpha: 0.1),
          title: 'Dark Theme',
          subtitle: darkModeEnabled ? 'Dark theme active' : 'Light theme active',
          trailing: Switch.adaptive(
            value: darkModeEnabled,
            activeTrackColor: AppColors.primary,
            onChanged: (val) {
              onDarkModeChanged(val);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(val ? 'Dark mode enabled' : 'Light mode enabled'),
                  duration: const Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        ),
        ProfileMenuItem(
          icon: Icons.vibration_rounded,
          iconColor: const Color(0xFF16A085),
          iconBackgroundColor: const Color(0xFF16A085).withValues(alpha: 0.1),
          title: 'Haptic Feedback',
          subtitle: 'Vibrate on task check & completion',
          trailing: Switch.adaptive(
            value: hapticsEnabled,
            activeTrackColor: AppColors.primary,
            onChanged: onHapticsChanged,
          ),
        ),
        ProfileMenuItem(
          icon: Icons.language_rounded,
          iconColor: const Color(0xFFD35400),
          iconBackgroundColor: const Color(0xFFD35400).withValues(alpha: 0.1),
          title: 'Language',
          subtitle: selectedLanguage,
          onTap: () => ProfileDialogs.showLanguageSelector(
            context,
            currentLanguage: selectedLanguage,
            onSelected: onLanguageChanged,
          ),
          showDivider: false,
        ),
      ],
    );
  }
}
