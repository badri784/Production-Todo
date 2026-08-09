import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/icon/icon_login.png'),
        Text(
          'Welcome Back.',
          style: GoogleFonts.nunitoSans(
            fontSize: 32,
            fontWeight: FontWeightHelper.extraBold,
          ),
        ),
        Text(
          'Sign in to continue to FocusFlow..',
          style: GoogleFonts.nunitoSans(
            fontSize: 14,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
      ],
    );
  }
}
