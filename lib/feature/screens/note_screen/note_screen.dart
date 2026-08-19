
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_todo/feature/screens/note_screen/cubit/note_state_cubit.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/note_screen_body.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteStateCubit(),
      child: const NoteScreenBody(),
    );
  }
}
