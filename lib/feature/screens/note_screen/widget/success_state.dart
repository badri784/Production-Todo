import 'package:flutter/material.dart';
import 'package:pro_todo/feature/screens/note_screen/cubit/note_state_cubit.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/note_card.dart';

class NoteScreenSuccessState extends StatelessWidget {
  final NoteStateSuccess state;
  const NoteScreenSuccessState({
    super.key,
    required this.scrollController,
    required this.state,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Scrollbar(
        controller: scrollController,
        trackVisibility: true,
        thumbVisibility: true,
        interactive: true,
        thickness: 2,
        radius: const Radius.circular(4),
        child: ListView.builder(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemCount: state.nodeModels.length,
          itemBuilder: (context, index) {
            final note = state.nodeModels[index];
            return NoteCard(note: note);
          },
        ),
      ),
    );
  }
}
