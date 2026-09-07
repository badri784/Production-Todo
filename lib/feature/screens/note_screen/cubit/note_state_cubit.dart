import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pro_todo/core/model/node_model.dart';

part 'note_state_state.dart';

class NoteStateCubit extends Cubit<NoteStateState> {
  NoteStateCubit() : super(NoteStateInitial());
  final List<NoteModel> notes = [];
  static const String noteBoxName = 'note';
  final noteBox = Hive.box<NoteModel>(noteBoxName);

  void saveNote(NoteModel nodeModel) async {
    try {
      emit(NoteStateLoading());
      notes.add(nodeModel);
      await noteBox.add(nodeModel);
      emit(NoteStateSuccess(nodeModels: notes));
      log(nodeModel.noteTitle.toString());
    } catch (massage) {
      emit(NoteStateError(message: massage.toString()));
    }
  }

  void deleteNote(String noteId) async {
    try {
      emit(NoteStateLoading());
      notes.removeWhere((note) => note.noteId == noteId);
      await noteBox.delete(noteId);
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
