part of 'note_state_cubit.dart';

sealed class NoteStateState {
  const NoteStateState();
}

final class NoteStateInitial extends NoteStateState {}

final class NoteStateLoading extends NoteStateState {}

final class NoteStateGeneratingNote extends NoteStateState {
  const NoteStateGeneratingNote();
}

final class NoteStateListening extends NoteStateState {
  const NoteStateListening();
}

final class NoteStateSavedSuccessfully extends NoteStateState {
  final NoteModel noteModel;
  const NoteStateSavedSuccessfully({required this.noteModel});
}

final class NoteStateSuccess extends NoteStateState {
  final List<NoteModel> nodeModels;

  const NoteStateSuccess({required this.nodeModels});
}

final class NoteStateError extends NoteStateState {
  final String message;
  const NoteStateError({required this.message});
}
