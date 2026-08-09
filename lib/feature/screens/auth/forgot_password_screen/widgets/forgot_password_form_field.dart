import 'package:flutter/material.dart';
import 'package:pro_todo/feature/widget/custom_text_form_field.dart';

class ForgotPasswordFormField extends StatelessWidget {
  const ForgotPasswordFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Email Address',
      outLienBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      prefixIcon: const Icon(Icons.email_outlined),
    );
  }
}
