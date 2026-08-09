import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';

class TextInSplashScreen extends StatelessWidget {
  const TextInSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Master Your',
          style: GoogleFonts.nunitoSans(
            fontSize: 32,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        Text(
          'Productivity.',
          style: GoogleFonts.nunitoSans(
            fontSize: 32,
            fontWeight: FontWeightHelper.bold,
          ),
        ),

        Text(
          'Organize, Vocalize, and Automate with AI.',
          style: GoogleFonts.nunitoSans(
            fontSize: 16,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
      ],
    );
  }
}
