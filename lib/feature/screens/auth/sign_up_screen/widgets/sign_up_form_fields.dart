import 'package:flutter/material.dart';
import 'package:pro_todo/feature/widget/custom_text_form_field.dart';

class SignUpFormFields extends StatelessWidget {
  const SignUpFormFields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: nameController,
          hintText: 'Full Name',
          outLienBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: const Icon(Icons.person_outline),
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          controller: emailController,
          hintText: 'Email Address',
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
      ],
    );
  }
}
