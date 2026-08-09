import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/extension.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.arrow_back,
                  size: 18,
                  color: Color(0xff154212),
                ),
                const SizedBox(width: 4),
                Text(
                  'Back to Login',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 14,
                    fontWeight: FontWeightHelper.semiBold,
                    color: const Color(0xff154212),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Reset Password',
          style: GoogleFonts.nunitoSans(
            fontSize: 28,
            fontWeight: FontWeightHelper.extraBold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Enter your registered email to receive a\n  password reset link.',
          textAlign: TextAlign.center,
          style: GoogleFonts.nunitoSans(
            fontSize: 16,
            fontWeight: FontWeightHelper.regular,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
