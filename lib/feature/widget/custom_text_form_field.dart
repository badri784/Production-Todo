import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.validator,
    this.controller,
    this.obscureText,
    this.suffixIcon,
    this.hintText,
    this.prefixIcon,
    this.outLienBorder,
    this.maxLines,
    this.labelText,
    this.maxlenght,
  });
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? hintText;
  final Widget? prefixIcon;
  final OutlineInputBorder? outLienBorder;
  final int? maxLines;
  final String? labelText;
  final int? maxlenght;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      validator: validator,
      controller: controller,
      obscureText: obscureText ?? false,
      maxLines: maxLines,
      maxLength: maxlenght,
      decoration: InputDecoration(
        labelText: labelText,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),

        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: outLienBorder,
      ),
    );
  }
}
