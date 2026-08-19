
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/screens/note_screen/add_new_note.dart';
import 'package:pro_todo/feature/screens/note_screen/cubit/note_state_cubit.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/note_card.dart';
import 'package:pro_todo/feature/widget/floating_action_bottom_widget.dart';

class NoteScreenBody extends StatelessWidget {
  const NoteScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (_) {
          return BlocProvider.value(
            value: context.read<NoteStateCubit>(),
            child: const SingleChildScrollView(child: AddNewNote()),
          );
        },
      );
    }

    Widget searchField() {
      return TextField(
        onChanged: (value) {
          context.read<NoteStateCubit>().searchNote(value);
          log(value);
        },
        decoration: const InputDecoration(
          hintText: 'Search note',
          prefixIcon: Icon(Icons.search),
        ),
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionBottomWidget(
        icon: Icons.mic,
        onPressed: onPressed,
      ),
      appBar: AppBar(
        title: const Text('Your Notes'),
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: searchField,
              icon: const Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: BlocBuilder<NoteStateCubit, NoteStateState>(
        builder: (context, state) {
          if (state is NoteStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NoteStateError) {
            return Center(
              child: Text(
                state.message,
                style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  color: AppColors.error,
                ),
              ),
            );
          }

          if (state is NoteStateSuccess && state.nodeModels.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: state.nodeModels.length,
              itemBuilder: (context, index) {
                final note = state.nodeModels[index];
                return NoteCard(note: note);
              },
            );
          }

          // ── Empty state ──
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.description_outlined,
                  size: 64,
                  color: AppColors.textHint.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 16),
                Text(
                  'No notes yet',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 18,
                    fontWeight: FontWeightHelper.semiBold,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Tap the mic button to add your first note',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 14,
                    color: AppColors.textHint,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

