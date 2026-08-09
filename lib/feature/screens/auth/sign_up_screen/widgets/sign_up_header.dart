import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Color(0xff154212),
              size: 28,
            ),
            const SizedBox(width: 8),
            Text(
              'FocusFlow',
              style: GoogleFonts.nunitoSans(
                fontSize: 18,
                fontWeight: FontWeightHelper.bold,
                color: const Color(0xff154212),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Create an Account',
          style: GoogleFonts.nunitoSans(
            fontSize: 28,
            fontWeight: FontWeightHelper.extraBold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Join us and start organizing your focus.',
          style: GoogleFonts.nunitoSans(
            fontSize: 14,
            fontWeight: FontWeightHelper.regular,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
