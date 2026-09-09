import 'package:flutter/material.dart';
import 'package:pro_todo/core/model/node_model.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/note_action_list.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/note_bottom_sheet_handle.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/note_info_header.dart';

class EditAndDeletNote extends StatelessWidget {
  const EditAndDeletNote({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 22, right: 22),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NoteBottomSheetHandle(),
          NoteInfoHeader(note: note),
          const SizedBox(height: 12),
          const Divider(color: Color(0xffebefea)),
          const NoteActionList(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
