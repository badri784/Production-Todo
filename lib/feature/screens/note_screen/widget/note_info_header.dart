import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pro_todo/core/model/node_model.dart';

import '../../../../core/helpers/font_weight.dart';

class NoteInfoHeader extends StatelessWidget {
  const NoteInfoHeader({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.brown,
              ),
            ),
            const SizedBox(width: 6),
            const Text(
              'ACTIVE DOCUMENT',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Text(
          note.noteTitle ?? 'Something went wrong ',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 18,
            fontWeight: FontWeightHelper.semiBold,
          ),
        ),
        if (note.createdAt != null)
          Row(
            children: [
              const Text('Last edited '),
              Text(
                DateFormat('MMM d, yyyy').format(note.createdAt!),
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
