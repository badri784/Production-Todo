import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.validator,
    this.controller,
    this.obscureText,
  });
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText ?? false,
    );
  }
}
