import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/feature/widget/cutom_elevated_botton.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomElevatedButton(
          borderRadius: 16,
          text: Text(
            'SIGN UP',
            style: GoogleFonts.nunitoSans(
              fontSize: 14,
              fontWeight: FontWeightHelper.bold,
              letterSpacing: 1.5,
            ),
          ),
          onPressed: () {},
          backgroundColor: const Color(0xff154212),
          textColor: Colors.white,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: Divider()),
            const SizedBox(width: 10),
            Text(
              'OR SIGN UP WITH',
              style: GoogleFonts.nunitoSans(
                fontSize: 12,
                fontWeight: FontWeightHelper.regular,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: CustomElevatedButton(
                borderRadius: 12,
                text: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FaIcon(FontAwesomeIcons.google),
                    const SizedBox(width: 8),
                    Text(
                      'Google',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 14,
                        fontWeight: FontWeightHelper.bold,
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
                border: const BorderSide(color: Colors.black12, width: 1),
                backgroundColor: Colors.white,
                textColor: Colors.black87,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomElevatedButton(
                borderRadius: 12,
                text: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FaIcon(FontAwesomeIcons.facebook),
                    const SizedBox(width: 8),
                    Text(
                      'Facebook',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 14,
                        fontWeight: FontWeightHelper.bold,
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
                border: const BorderSide(color: Colors.black12, width: 1),
                backgroundColor: Colors.white,
                textColor: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
