import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_todo/core/helpers/font_weight.dart';
import 'package:pro_todo/core/model/node_model.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/screens/note_screen/cubit/note_state_cubit.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/action_buttons.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/detected_entities_section.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/drag_handle.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/mic_listening_section.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/note_date_picker_section.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/note_description_field.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/note_title_field.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({super.key});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteStateCubit, NoteStateState>(
      listener: (context, state) {
        // ── Auto-pop on successful save (voice or manual) ──
        if (state is NoteStateSavedSuccessfully) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.white, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Note saved: ${state.noteModel.noteTitle ?? 'Untitled'}',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 14,
                        fontWeight: FontWeightHelper.semiBold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              backgroundColor: AppColors.primary,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.all(16),
              duration: const Duration(seconds: 3),
            ),
          );
        }

        // ── Show AlertDialog on errors ──
        if (state is NoteStateError) {
          _showErrorDialog(context, state.message);
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Drag Handle ──
              const DragHandle(),
              const Gap(16),
              // ── Mic / Listening Row ──
              const MicListeningSection(),
              const Gap(20),
              // ── Title Field ──
              NoteTitleField(controller: _titleController),
              const Gap(12),
              // ── Description Field ──
              NoteDescriptionField(controller: _descriptionController),
              const Gap(16),
              // ── Date Picker Row ──
              NoteDatePickerSection(
                selectedDate: _selectedDate,
                onDateChanged: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
              const Gap(20),
              // ── Detected Entities ──
              DetectedEntitiesSection(
                titleText: _titleController.text,
                formattedDate: _selectedDate != null
                    ? _formatDate(_selectedDate!)
                    : null,
              ),
              // ── Action Buttons ──
              BlocBuilder<NoteStateCubit, NoteStateState>(
                builder: (context, state) {
                  return ActionButtons(
                    state: state,
                    onCancel: () => Navigator.of(context).pop(),
                    onSave: () {
                      if (formKey.currentState!.validate()) {
                        context.read<NoteStateCubit>().saveNote(
                          NoteModel(
                            noteTitle: _titleController.text,
                            noteDescription: _descriptionController.text,
                            createdAt: _selectedDate,
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    // Clean up the error message for user display
    String displayMessage = message;
    if (message.startsWith('Exception: ')) {
      displayMessage = message.replaceFirst('Exception: ', '');
    }

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        icon: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.error.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.error_outline_rounded,
            color: AppColors.error,
            size: 36,
          ),
        ),
        title: Text(
          'Something Went Wrong',
          style: GoogleFonts.nunitoSans(
            fontSize: 18,
            fontWeight: FontWeightHelper.bold,
            color: AppColors.textPrimary,
          ),
        ),
        content: Text(
          displayMessage,
          textAlign: TextAlign.center,
          style: GoogleFonts.nunitoSans(
            fontSize: 14,
            fontWeight: FontWeightHelper.regular,
            color: AppColors.textSecondary,
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                'Try Again',
                style: GoogleFonts.nunitoSans(
                  fontSize: 15,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final picked = DateTime(date.year, date.month, date.day);

    if (picked == today) {
      return 'Today';
    } else if (picked == tomorrow) {
      return 'Tomorrow';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
