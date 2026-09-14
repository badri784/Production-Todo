import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/screens/note_screen/cubit/note_state_cubit.dart';

class MicListeningSection extends StatefulWidget {
  const MicListeningSection({super.key, this.onMicTap});

  final VoidCallback? onMicTap;

  @override
  State<MicListeningSection> createState() => _MicListeningSectionState();
}

class _MicListeningSectionState extends State<MicListeningSection> {
  @override
  Widget build(BuildContext context) {
    final bool cubsit = context.read<NoteStateCubit>().isListening;
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
                  cubsit
                      ? 'Listening... Tap To Stop'
                      : 'Not Listening... Tap And Speek',
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
            onTap: widget.onMicTap,
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
