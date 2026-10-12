import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/screens/note_screen/cubit/note_state_cubit.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({super.key, required this.state});

  final NoteStateError state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        state.message,
        style: GoogleFonts.nunitoSans(fontSize: 16, color: AppColors.error),
      ),
    );
  }
}
