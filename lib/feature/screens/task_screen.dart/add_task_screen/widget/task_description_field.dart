import 'package:flutter/material.dart';
import 'package:pro_todo/feature/widget/custom_text_form_field.dart';

class TaskDescriptionField extends StatelessWidget {
  const TaskDescriptionField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      validator: (textValue) {
        if (textValue == null || textValue.isEmpty) {
          return 'This is a required field';
        }
        return null;
      },
      maxLines: 5,
      maxlenght: 500,
      hintText: 'Task Description...',
      filled: true,
      fillColor: const Color(0xFFEEEEEE),
      outLienBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }
}
