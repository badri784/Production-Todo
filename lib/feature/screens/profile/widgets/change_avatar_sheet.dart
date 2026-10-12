import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/theme/app_colors.dart';

class ChangeAvatarSheet extends StatefulWidget {
  final VoidCallback onAvatarUpdated;

  const ChangeAvatarSheet({
    super.key,
    required this.onAvatarUpdated,
  });

  static Future<void> show(
    BuildContext context, {
    required VoidCallback onAvatarUpdated,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ChangeAvatarSheet(onAvatarUpdated: onAvatarUpdated),
    );
  }

  @override
  State<ChangeAvatarSheet> createState() => _ChangeAvatarSheetState();
}

class _ChangeAvatarSheetState extends State<ChangeAvatarSheet> {
  final List<String> _presetAvatars = [
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150',
  ];

  bool _isLoading = false;

  Future<void> _updateAvatar(String? url) async {
    setState(() => _isLoading = true);
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updatePhotoURL(url);
        await user.reload();
      }
      widget.onAvatarUpdated();
      if (!mounted) return;
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Avatar updated successfully!',
            style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w600),
          ),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update avatar: $e'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 28,
        left: 20,
        right: 20,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 44,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Choose Profile Picture',
                style: GoogleFonts.nunitoSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close_rounded, size: 22),
                color: AppColors.textSecondary,
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'Select from preset avatars or restore default',
            style: GoogleFonts.nunitoSans(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          if (_isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            )
          else ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ..._presetAvatars.map((url) {
                  return InkWell(
                    onTap: () => _updateAvatar(url),
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.border, width: 2),
                      ),
                      child: CircleAvatar(
                        radius: 26,
                        backgroundImage: NetworkImage(url),
                      ),
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: () => _updateAvatar(null),
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: Text(
                'Use Default Illustration',
                style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w700),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 46),
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
