import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  Future<void> sendPasswordResetEmail({required String email}) async {
    emit(ForgotPasswordLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ForgotPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          emit(ForgotPasswordFailure(error: 'No account found for that email.'));
          break;
        case 'invalid-email':
          emit(ForgotPasswordFailure(error: 'The email address is invalid.'));
          break;
        default:
          emit(ForgotPasswordFailure(error: e.message ?? 'Something went wrong.'));
      }
    } catch (e) {
      emit(ForgotPasswordFailure(error: 'Failed to send reset email. Please try again.'));
    }
  }
}
