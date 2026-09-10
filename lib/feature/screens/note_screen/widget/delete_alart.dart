import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_todo/core/helpers/extension.dart';
import 'package:pro_todo/core/model/node_model.dart';
import 'package:pro_todo/feature/screens/note_screen/cubit/note_state_cubit.dart';

class DeleteAlart extends StatelessWidget {
  const DeleteAlart({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Note'),
      content: const Text('Are you sure you want to delete this note?'),
      actions: [
        TextButton(onPressed: () => context.pop(), child: const Text('Cancel')),
        TextButton(
          onPressed: () {
            context.read<NoteStateCubit>().deleteNote(note.noteId);
            context.pop();
            context.pop();
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
