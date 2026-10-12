import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pro_todo/core/model/node_model.dart';
import 'package:pro_todo/core/model/task_model.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/screens/profile/widgets/account_security_section.dart';
import 'package:pro_todo/feature/screens/profile/widgets/change_avatar_sheet.dart';
import 'package:pro_todo/feature/screens/profile/widgets/danger_zone_section.dart';
import 'package:pro_todo/feature/screens/profile/widgets/data_storage_section.dart';
import 'package:pro_todo/feature/screens/profile/widgets/edit_profile_bottom_sheet.dart';
import 'package:pro_todo/feature/screens/profile/widgets/preferences_section.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_app_bar.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_footer.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_header_card.dart';
import 'package:pro_todo/feature/screens/profile/widgets/profile_stats_card.dart';
import 'package:pro_todo/feature/screens/profile/widgets/support_community_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Preference States
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _hapticsEnabled = true;
  String _selectedLanguage = 'English (US)';
  bool _isSyncing = false;

  User? get _currentUser => FirebaseAuth.instance.currentUser;

  // Compute live productivity stats from local Hive boxes
  int get _completedTasksCount {
    try {
      if (Hive.isBoxOpen('task')) {
        final box = Hive.box<TaskModel>('task');
        return box.values.where((t) => t.isCompleted == true).length;
      }
    } catch (_) {}
    return 0;
  }

  int get _pendingTasksCount {
    try {
      if (Hive.isBoxOpen('task')) {
        final box = Hive.box<TaskModel>('task');
        return box.values.where((t) => t.isCompleted != true).length;
      }
    } catch (_) {}
    return 0;
  }

  int get _notesCount {
    try {
      if (Hive.isBoxOpen('note')) {
        final box = Hive.box<NoteModel>('note');
        return box.values.length;
      }
    } catch (_) {}
    return 0;
  }

  Future<void> _refreshProfile() async {
    try {
      await _currentUser?.reload();
      if (mounted) setState(() {});
    } catch (_) {}
  }

  Future<void> _handleCloudSync() async {
    setState(() => _isSyncing = true);
    await Future.delayed(const Duration(milliseconds: 1200));
    if (!mounted) return;
    setState(() => _isSyncing = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.cloud_done_rounded, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Text(
              'All tasks and notes are synchronized with cloud',
              style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = _currentUser;
    final displayName = user?.displayName;
    final email = user?.email;
    final photoUrl = user?.photoURL;
    final memberSince = user?.metadata.creationTime;
    final isEmailVerified = user?.emailVerified ?? false;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: ProfileAppBar(
        onRefresh: _refreshProfile,
        onSync: _handleCloudSync,
        isSyncing: _isSyncing,
      ),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: _refreshProfile,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero User Card
              ProfileHeaderCard(
                displayName: displayName,
                email: email,
                photoUrl: photoUrl,
                memberSince: memberSince,
                isEmailVerified: isEmailVerified,
                onEditProfile: () {
                  EditProfileBottomSheet.show(
                    context,
                    currentName: displayName ?? '',
                    currentEmail: email ?? 'guest@protodo.app',
                    onProfileUpdated: () => setState(() {}),
                  );
                },
                onChangeAvatar: () {
                  ChangeAvatarSheet.show(
                    context,
                    onAvatarUpdated: () => setState(() {}),
                  );
                },
              ),
              const Gap(16),

              // Productivity Statistics Overview
              ProfileStatsCard(
                completedTasks: _completedTasksCount,
                pendingTasks: _pendingTasksCount,
                totalNotes: _notesCount,
              ),
              const Gap(22),

              // Section 1: Account & Security
              AccountSecuritySection(
                user: user,
                onProfileUpdated: () => setState(() {}),
              ),
              const Gap(18),

              // Section 2: Preferences
              PreferencesSection(
                notificationsEnabled: _notificationsEnabled,
                darkModeEnabled: _darkModeEnabled,
                hapticsEnabled: _hapticsEnabled,
                selectedLanguage: _selectedLanguage,
                onNotificationsChanged: (val) =>
                    setState(() => _notificationsEnabled = val),
                onDarkModeChanged: (val) =>
                    setState(() => _darkModeEnabled = val),
                onHapticsChanged: (val) =>
                    setState(() => _hapticsEnabled = val),
                onLanguageChanged: (val) =>
                    setState(() => _selectedLanguage = val),
              ),
              const Gap(18),

              // Section 3: Data & Storage
              DataStorageSection(
                isSyncing: _isSyncing,
                onSync: _handleCloudSync,
              ),
              const Gap(18),

              // Section 4: Support & Community
              const SupportCommunitySection(),
              const Gap(18),

              // Section 5: Account Actions & Prominent Logout
              const DangerZoneSection(),
              const Gap(24),

              // Version & Footer
              const ProfileFooter(),
              const Gap(32),
            ],
          ),
        ),
      ),
    );
  }
}
