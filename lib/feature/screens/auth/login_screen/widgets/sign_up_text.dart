import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/extension.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/core/routing/routes.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account? ',
            style: GoogleFonts.nunitoSans(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'Sign Up',
            style: GoogleFonts.nunitoSans(
              fontSize: 14,
              fontWeight: FontWeightHelper.bold,
              color: const Color(0xff154212),
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementName(Routes.signUpRoute);
              },
          ),
        ],
      ),
    );
  }
}
