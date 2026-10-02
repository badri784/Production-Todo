import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/screens/note_screen/add_new_note.dart';
import 'package:pro_todo/feature/screens/note_screen/cubit/note_state_cubit.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/empty_state.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/note_card.dart';
import 'package:pro_todo/feature/widget/floating_action_bottom_widget.dart';

class NoteScreenBody extends StatefulWidget {
  const NoteScreenBody({super.key});

  @override
  State<NoteScreenBody> createState() => _NoteScreenBodyState();
}

class _NoteScreenBodyState extends State<NoteScreenBody> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onPressed(BuildContext context) {
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

  Widget searchField(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionBottomWidget(
        icon: Icons.mic,
        onPressed: () => onPressed(context),
      ),
      appBar: AppBar(
        title: const Text('Your Notes'),
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () => searchField(context),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  itemCount: state.nodeModels.length,
                  itemBuilder: (context, index) {
                    final note = state.nodeModels[index];
                    return NoteCard(note: note);
                  },
                ),
              ),
            );
          }

          // ── Empty state ──
          return const EmptyState();
        },
      ),
    );
  }
}
