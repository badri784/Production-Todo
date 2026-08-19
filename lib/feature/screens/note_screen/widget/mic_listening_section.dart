import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/core/theme/app_colors.dart';

class MicListeningSection extends StatelessWidget {
  const MicListeningSection({super.key, this.onMicTap});

  final VoidCallback? onMicTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.secondaryBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Listening...',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 18,
                    fontWeight: FontWeightHelper.semiBold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const Gap(2),
                Text(
                  'Speak clearly into the microphone',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 13,
                    fontWeight: FontWeightHelper.regular,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onMicTap,
            child: const CircleAvatar(
              radius: 22,
              backgroundColor: Color(0xFFFFF5DD),
              child: Icon(Icons.mic, color: Color(0xFF775A00), size: 22),
            ),
          ),
        ],
      ),
    );
  }
}
