import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/extension.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/core/routing/routes.dart';
import 'package:pro_todo/feature/widget/cutom_elevated_botton.dart';

class ElevatedInSplashScreen extends StatelessWidget {
  const ElevatedInSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomElevatedButton(
          text: const Text('Get Started'),
          onPressed: () {
            context.pushReplacementName(Routes.signUpRoute);
          },
          backgroundColor: const Color(0xff154212),
          borderRadius: 12,
          customTextStyle: GoogleFonts.nunitoSans(
            fontSize: 12,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        const SizedBox(height: 10),
        CustomElevatedButton(
          customTextStyle: GoogleFonts.nunitoSans(
            fontSize: 12,
            fontWeight: FontWeightHelper.bold,
            color: const Color(0xff154212),
          ),
          text: const Text('I already have an account'),
          textColor: const Color(0xff154212),
          onPressed: () {
            context.pushReplacementName(Routes.loginRoute);
          },
          backgroundColor: Colors.white,
          borderRadius: 12,
          border: const BorderSide(color: Colors.black54, width: 1),
        ),
      ],
    );
  }
}
