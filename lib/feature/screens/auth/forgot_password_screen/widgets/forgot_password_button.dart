import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/feature/widget/cutom_elevated_botton.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomElevatedButton(
          borderRadius: 16,
          text: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Send Reset Link ',
                style: GoogleFonts.nunitoSans(
                  fontSize: 14,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
              const Icon(Icons.arrow_forward),
            ],
          ),
          onPressed: () {},
          backgroundColor: const Color(0xff154212),
          textColor: Colors.white,
        ),
      ],
    );
  }
}
