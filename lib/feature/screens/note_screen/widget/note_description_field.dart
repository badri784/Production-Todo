import 'package:flutter/material.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/widget/custom_text_form_field.dart';

class NoteDescriptionField extends StatelessWidget {
  const NoteDescriptionField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Description cannot be empty';
        }
        return null;
      },
      maxLines: 3,
      maxlenght: 500,
      labelText: 'Description',
      outLienBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.border),
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }
}
