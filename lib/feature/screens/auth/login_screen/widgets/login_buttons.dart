import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/feature/widget/cutom_elevated_botton.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

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
                'Log in ',
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
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: Divider()),
            const SizedBox(width: 10),
            Text(
              'Or sign in with ',
              style: GoogleFonts.nunitoSans(fontSize: 14),
            ),
            const SizedBox(width: 10),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 25),
        CustomElevatedButton(
          borderRadius: 16,
          text: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign in with Google ',
                style: GoogleFonts.nunitoSans(
                  fontSize: 14,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
              const Icon(Icons.g_mobiledata),
            ],
          ),
          onPressed: () {},
          border: const BorderSide(color: Colors.black54, width: 1),
          backgroundColor: Colors.white,
          textColor: const Color(0xff154212),
        ),
        const SizedBox(height: 10),
        CustomElevatedButton(
          borderRadius: 16,
          text: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign in with Facebook ',
                style: GoogleFonts.nunitoSans(
                  fontSize: 14,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
              const Icon(Icons.facebook),
            ],
          ),
          onPressed: () {},
          border: const BorderSide(color: Colors.black54, width: 1),
          backgroundColor: Colors.white,
          textColor: const Color(0xff154212),
        ),
      ],
    );
  }
}
