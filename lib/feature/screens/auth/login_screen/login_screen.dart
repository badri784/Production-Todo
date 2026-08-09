import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/feature/widget/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

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
              const CustomTextFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
