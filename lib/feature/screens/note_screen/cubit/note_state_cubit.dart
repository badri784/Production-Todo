import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pro_todo/core/servise/ai_assestant/class_ai_note.dart';
import 'package:pro_todo/core/model/node_model.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'note_state_state.dart';

class NoteStateCubit extends Cubit<NoteStateState> {
  NoteStateCubit({AiNote? aiNote})
    : _aiNote = aiNote ?? AiNote(),
      super(NoteStateInitial()) {
    init();
  }

  final AiNote _aiNote;
  bool isSpeechAvailable = false;
  bool isListening = false;
  String lastWords = '';
  final List<NoteModel> notes = [];
  static const String noteBoxName = 'note';
  final noteBox = Hive.box<NoteModel>(noteBoxName);
  final speech = SpeechToText();

  //====================================
  /// Loads notes from Hive, then initializes speech — emits once at the end
  Future<void> init() async {
    try {
      emit(NoteStateLoading());
      // 1. Load notes from Hive
      final loadedNotes = noteBox.values.toList();
      notes.addAll(loadedNotes);

      // 2. Init speech silently (no separate emit)
      try {
        isSpeechAvailable = await speech.initialize();
        isListening = false;
        log(
          '===========================   Speech available: $isSpeechAvailable   ===========================',
        );
      } catch (_) {
        isSpeechAvailable = false;
      }

      // 3. Emit the final state with notes
      emit(NoteStateSuccess(nodeModels: List.from(notes)));
    } catch (e) {
      emit(NoteStateError(message: e.toString()));
    }
  }

  Future<void> startListening() async {
    try {
      // If permission was denied before, re-request it when user taps record
      if (!isSpeechAvailable) {
        isSpeechAvailable = await speech.initialize();
        if (!isSpeechAvailable) {
          emit(
            const NoteStateError(
              message:
                  'Microphone permission denied. Please enable it in settings.',
            ),
          );
          return;
        }
      }
      await speech.listen(
        localeId: 'ar_EG',
        onResult: (result) {
          lastWords = result.recognizedWords;
          log(lastWords);
        },
      );
      isListening = true;
      emit(const NoteStateListening());
    } catch (e) {
      emit(NoteStateError(message: e.toString()));
    }
  }

  Future<void> stopListening() async {
    try {
      await speech.stop();
      // Check if user actually said something
      if (lastWords.trim().isEmpty) {
        emit(
          const NoteStateError(message: 'No speech detected, please try again'),
        );
        return;
      }
      isListening = false;
      // Show generating state BEFORE calling AI
      emit(const NoteStateGeneratingNote());
      final NoteModel noteModel = await _aiNote.extractNote(lastWords);

      // Save the note and emit saved state so UI can auto-pop
      await _saveNoteInternal(noteModel);
      emit(NoteStateSavedSuccessfully(noteModel: noteModel));

      // Emit success with updated list so NoteScreenBody refreshes
      emit(NoteStateSuccess(nodeModels: List.from(notes)));

      // Reset lastWords for next recording
      lastWords = '';
    } catch (e) {
      isListening = false;
      emit(NoteStateError(message: e.toString()));
    }
  }

  /// Internal save — does NOT emit loading/success (used by stopListening)
  Future<void> _saveNoteInternal(NoteModel noteModel) async {
    notes.add(noteModel);
    await noteBox.put(noteModel.noteId, noteModel);
    log('Note saved: ${noteModel.noteTitle}');
  }

  /// Public save — emits loading + success (used by manual Save button)
  Future<void> saveNote(NoteModel nodeModel) async {
    try {
      emit(NoteStateLoading());
      await _saveNoteInternal(nodeModel);
      emit(NoteStateSavedSuccessfully(noteModel: nodeModel));

      // Emit success with updated list so NoteScreenBody refreshes
      emit(NoteStateSuccess(nodeModels: List.from(notes)));
    } catch (e) {
      emit(NoteStateError(message: e.toString()));
    }
  }

  Future<void> deleteNote(String noteId) async {
    try {
      await noteBox.delete(noteId);
      notes.removeWhere((note) => note.noteId == noteId);
      emit(NoteStateSuccess(nodeModels: notes));
    } catch (e) {
      emit(NoteStateError(message: e.toString()));
    }
  }

  void searchNote(String search) {
    try {
      emit(NoteStateLoading());
      final filteredNotes = notes.where((note) {
        return note.noteTitle.toString().toLowerCase().contains(
              search.toLowerCase(),
            ) ||
            note.noteDescription.toString().toLowerCase().contains(
              search.toLowerCase(),
            );
      }).toList();
      emit(NoteStateSuccess(nodeModels: filteredNotes));
    } catch (e) {
      emit(NoteStateError(message: e.toString()));
    }
  }
}
