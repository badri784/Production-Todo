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
    this.filled,
    this.fillColor,
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
  final bool? filled;
  final Color? fillColor;
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
        filled: filled ?? false,
        fillColor: fillColor,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: outLienBorder?.borderRadius ?? BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: filled == true
              ? BorderSide.none
              : const BorderSide(color: Colors.blue),
          borderRadius: outLienBorder?.borderRadius ?? BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: filled == true
              ? BorderSide.none
              : const BorderSide(color: Colors.grey),
          borderRadius: outLienBorder?.borderRadius ?? BorderRadius.circular(4),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade500,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: outLienBorder,
      ),
    );
  }
}
