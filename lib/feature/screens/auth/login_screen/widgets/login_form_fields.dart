import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/extension.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/core/routing/routes.dart';
import 'package:pro_todo/feature/widget/custom_text_form_field.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: emailController,
          hintText: 'Email address',
          outLienBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: const Icon(Icons.email_outlined),
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          controller: passwordController,
          hintText: 'Password',
          obscureText: true,
          outLienBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: const Icon(Icons.visibility_off_outlined),
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              context.pushnamed(Routes.forgotPasswordRoute);
            },
            child: Text(
              'Forgot password?',
              style: GoogleFonts.nunitoSans(
                fontSize: 12,
                fontWeight: FontWeightHelper.bold,
                color: const Color(0xff50714d),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
