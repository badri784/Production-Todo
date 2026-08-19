part of 'note_state_cubit.dart';

sealed class NoteStateState extends Equatable {
  const NoteStateState();

  @override
  List<Object> get props => [];
}

final class NoteStateInitial extends NoteStateState {}

final class NoteStateLoading extends NoteStateState {}

final class NoteStateSuccess extends NoteStateState {
  final List<NoteModel> nodeModels;

  const NoteStateSuccess({required this.nodeModels});

  @override
  List<Object> get props => [nodeModels];
}

final class NoteStateError extends NoteStateState {
  final String message;
  const NoteStateError({required this.message});

  @override
  List<Object> get props => [message];
}
