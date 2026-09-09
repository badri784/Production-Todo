import 'package:flutter/material.dart';
import 'package:pro_todo/core/theme/app_colors.dart';

class NoteBottomSheetHandle extends StatelessWidget {
  const NoteBottomSheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(flex: 3),
        Expanded(
          child: Divider(
            thickness: 4,
            radius: BorderRadius.circular(20),
            color: AppColors.textHint,
          ),
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}
