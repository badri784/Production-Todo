import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pro_todo/core/theme/app_colors.dart';

class ProfileHeaderCard extends StatelessWidget {
  final String? displayName;
  final String? email;
  final String? photoUrl;
  final DateTime? memberSince;
  final bool isEmailVerified;
  final VoidCallback onEditProfile;
  final VoidCallback onChangeAvatar;

  const ProfileHeaderCard({
    super.key,
    this.displayName,
    this.email,
    this.photoUrl,
    this.memberSince,
    this.isEmailVerified = false,
    required this.onEditProfile,
    required this.onChangeAvatar,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveName = (displayName != null && displayName!.trim().isNotEmpty)
        ? displayName!.trim()
        : (email != null && email!.contains('@')
            ? email!.split('@').first
            : 'Productivity Achiever');

    final effectiveEmail = (email != null && email!.trim().isNotEmpty)
        ? email!.trim()
        : 'guest@protodo.app';

    final memberSinceText = memberSince != null
        ? 'Member since ${DateFormat.yMMMd().format(memberSince!)}'
        : 'Member since Oct 2026';

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.primaryDark,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.28),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background decorative ambient circles
          Positioned(
            right: -25,
            top: -25,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Positioned(
            left: -35,
            bottom: -35,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.accent.withValues(alpha: 0.08),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Avatar with badge
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.accent.withValues(alpha: 0.8),
                              width: 2.2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 36,
                            backgroundColor: AppColors.surface,
                            child: ClipOval(
                              child: _buildAvatarImage(),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Material(
                            color: AppColors.accent,
                            shape: const CircleBorder(),
                            elevation: 2,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              onTap: onChangeAvatar,
                              child: const Padding(
                                padding: EdgeInsets.all(6),
                                child: Icon(
                                  Icons.camera_alt_rounded,
                                  size: 14,
                                  color: AppColors.primaryDark,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),

                    // User Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  effectiveName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.accent,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  'PRO',
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.primaryDark,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.alternate_email_rounded,
                                size: 13,
                                color: AppColors.accentLight,
                              ),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  effectiveEmail,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white.withValues(alpha: 0.85),
                                  ),
                                ),
                              ),
                              if (isEmailVerified) ...[
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.verified_rounded,
                                  size: 14,
                                  color: AppColors.accent,
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.calendar_today_rounded,
                                  size: 11,
                                  color: AppColors.accentLight,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  memberSinceText,
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white.withValues(alpha: 0.9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Quick Edit Profile Action Button
                InkWell(
                  onTap: onEditProfile,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.25),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.edit_outlined,
                          size: 15,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Edit Profile & Information',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarImage() {
    if (photoUrl != null && photoUrl!.startsWith('http')) {
      return Image.network(
        photoUrl!,
        width: 72,
        height: 72,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => _buildFallbackImage(),
      );
    }
    return _buildFallbackImage();
  }

  Widget _buildFallbackImage() {
    return Image.asset(
      'assets/image/image.jpeg',
      width: 72,
      height: 72,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) {
        return const Icon(
          Icons.person,
          size: 44,
          color: AppColors.primary,
        );
      },
    );
  }
}
