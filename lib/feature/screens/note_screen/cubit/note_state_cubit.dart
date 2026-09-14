import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pro_todo/core/model/node_model.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'note_state_state.dart';

class NoteStateCubit extends Cubit<NoteStateState> {
  NoteStateCubit() : super(NoteStateInitial()) {
    initSpeechText();
  }

  final SpeechToText speechToText = SpeechToText();
  bool isSpeechAvailable = false;
  bool isListening = false;
  String lastWords = '';
  final List<NoteModel> notes = [];
  static const String noteBoxName = 'note';
  final noteBox = Hive.box<NoteModel>(noteBoxName);
  final speech = SpeechToText();

  //====================================
  Future<void> initSpeechText() async {
    isSpeechAvailable = await speech.initialize();
    if (isSpeechAvailable) {
      isListening = false;
    }
  }

  void startListening() async {
    try {
      speech.listen(
        localeId: 'ar_EG',
        // listenFor: const Duration(seconds: 15),
        onResult: (result) {
          lastWords = result.recognizedWords;
          log(lastWords);
          emit(const NoteStateListening());
        },
      );
      isListening = true;
    } catch (massage) {
      emit(NoteStateError(message: massage.toString()));
    }
  }

  void stopListening() {
    try {
      speech.stop();
      emit(const NoteStateStoping());
      isListening = false;
    } catch (massage) {
      emit(NoteStateError(message: massage.toString()));
    }
  }

  void loadNote(NoteModel nodeModel) {
    try {
      emit(NoteStateLoading());
      final loadedNotes = noteBox.values.toList();
      notes.addAll(loadedNotes);
      emit(NoteStateSuccess(nodeModels: notes));
    } catch (massage) {
      emit(NoteStateError(message: massage.toString()));
    }
  }

  // void unDo() {
  //   emit(NoteStateSuccess(nodeModels: notes));
  // }

  void saveNote(NoteModel nodeModel) async {
    try {
      emit(NoteStateLoading());
      notes.add(nodeModel);
      await noteBox.put(nodeModel.noteId, nodeModel);
      emit(NoteStateSuccess(nodeModels: notes));
      log(nodeModel.noteTitle.toString());
    } catch (massage) {
      emit(NoteStateError(message: massage.toString()));
    }
  }

  void deleteNote(String noteId) async {
    try {
      await noteBox.delete(noteId);
      notes.removeWhere((note) => note.noteId == noteId);
      emit(NoteStateSuccess(nodeModels: notes));
    } catch (massage) {
      emit(NoteStateError(message: massage.toString()));
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
    } catch (massage) {
      emit(NoteStateError(message: massage.toString()));
    }
  }
}
