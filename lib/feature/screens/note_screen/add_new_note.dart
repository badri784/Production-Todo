import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:pro_todo/core/model/node_model.dart';
import 'package:pro_todo/core/theme/app_colors.dart';
import 'package:pro_todo/feature/screens/note_screen/cubit/note_state_cubit.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/action_buttons.dart';
import 'package:pro_todo/feature/widget/date_picker_row.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/detected_entities_section.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/drag_handle.dart';
import 'package:pro_todo/feature/screens/note_screen/widget/mic_listening_section.dart';
import 'package:pro_todo/feature/widget/custom_text_form_field.dart';

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

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              secondary: AppColors.accent,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
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
      return DateFormat('MMM d, yyyy').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            MicListeningSection(
              onMicTap: () {
                // TODO: integrate speech-to-text
              },
            ),
            const Gap(20),

            // ── Title Field ──
            CustomTextFormField(
              controller: _titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Title cannot be empty';
                }
                return null;
              },
              maxLines: 1,
              maxlenght: 50,
              labelText: 'Title',
              outLienBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.border),
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            const Gap(12),

            // ── Description Field ──
            CustomTextFormField(
              controller: _descriptionController,
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
            ),
            const Gap(16),

            // ── Date Picker Row ──
            DatePickerRow(
              selectedDate: _selectedDate,
              formattedDate: _selectedDate != null
                  ? _formatDate(_selectedDate!)
                  : null,
              onTap: _pickDate,
              onClear: () {
                setState(() {
                  _selectedDate = null;
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
            ActionButtons(
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
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
