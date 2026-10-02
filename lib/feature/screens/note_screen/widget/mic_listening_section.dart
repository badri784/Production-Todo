import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/screens/note_screen/cubit/note_state_cubit.dart';

class MicListeningSection extends StatelessWidget {
  const MicListeningSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteStateCubit, NoteStateState>(
      builder: (context, state) {
        final isListening = context.read<NoteStateCubit>().isListening;
        final isGenerating = state is NoteStateGeneratingNote;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: isGenerating
                ? AppColors.primary.withValues(alpha: 0.08)
                : AppColors.secondaryBackground,
            borderRadius: BorderRadius.circular(14),
            border: isGenerating
                ? Border.all(color: AppColors.primary.withValues(alpha: 0.3))
                : null,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isGenerating
                          ? 'Note Generation in Progress...'
                          : isListening
                          ? 'Listening... Tap To Stop'
                          : 'Not Listening... Tap And Speek',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 18,
                        fontWeight: FontWeightHelper.semiBold,
                        color: isGenerating
                            ? AppColors.primary
                            : AppColors.textPrimary,
                      ),
                    ),
                    const Gap(2),
                    Text(
                      isGenerating
                          ? 'AI is processing your voice...'
                          : 'Speak clearly into the microphone',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 13,
                        fontWeight: FontWeightHelper.regular,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (isGenerating)
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: AppColors.primary,
                    ),
                  ),
                )
              else
                GestureDetector(
                  onTap: () async {
                    isListening
                        ? await context.read<NoteStateCubit>().stopListening()
                        : await context.read<NoteStateCubit>().startListening();
                  },
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: isListening
                        ? const Color(0xFFFFDDDD)
                        : const Color(0xFFFFF5DD),
                    child: Icon(
                      isListening ? Icons.stop : Icons.mic,
                      color: isListening ? Colors.red : const Color(0xFF775A00),
                      size: 22,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
