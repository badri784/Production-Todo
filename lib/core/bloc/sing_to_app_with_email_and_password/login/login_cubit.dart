import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_todo/core/dependance_injection/di.dart';
import 'package:pro_todo/core/helpers/extension.dart';
import 'package:pro_todo/core/routing/routes.dart';
import 'package:pro_todo/core/servise/login_service/login_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final LoginService _loginService = getIt.get<LoginService>();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final userCredential = await _loginService.logInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential != null) {
        emit(LoginSuccess());
        debugPrint('▶️${userCredential.user.toString()}');
      } else {
        emit(LoginFailure(error: 'Something went wrong'));
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          emit(LoginFailure(error: 'No account found for that email.'));
          break;
        case 'wrong-password':
          emit(LoginFailure(error: 'Wrong password. Please try again.'));
          break;
        case 'invalid-credential':
          emit(LoginFailure(error: 'Invalid email or password.'));
          break;
        case 'user-disabled':
          emit(LoginFailure(error: 'This account has been disabled.'));
          break;
        case 'too-many-requests':
          emit(
            LoginFailure(error: 'Too many attempts. Please try again later.'),
          );
          break;
        case 'invalid-email':
          emit(LoginFailure(error: 'The email address is invalid.'));
          break;
        default:
          emit(LoginFailure(error: e.message ?? 'Authentication failed.'));
      }
    } catch (e) {
      emit(LoginFailure(error: 'Login failed. Please check your credentials.'));
    }
  }

  Future<void> logOut(BuildContext context) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signOut();
      emit(LoginSuccess());
      if (context.mounted) {
        context.pushAndRemoveUntilname(Routes.splashRoute);
      }
    } catch (e) {
      emit(LoginFailure(error: 'logOut failed.'));
    }
  }
}
