import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'google_login_state.dart';

class GoogleLoginCubit extends Cubit<GoogleLoginState> {
  GoogleLoginCubit() : super(GoogleLoginInitial());

  Future<void> loginWithGoogle() async {
    emit(GoogleLoginLoading());
    try {
      // google_sign_in v7+ uses the singleton instance & authenticate()
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();

      // Obtain the ID token from the authenticated account
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      // Create a new credential (idToken is sufficient for Firebase auth)
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(GoogleLoginSuccess());
    } catch (e) {
      emit(GoogleLoginFailure(message: e.toString()));
    }
  }

  // Future<void> loginWithFacebook() async {
  //   emit(GoogleLoginLoading());
  //   try {
  //     // Trigger the sign-in flow
  //     final LoginResult loginResult = await FacebookAuth.instance.login();
  //     if (loginResult.status == LoginStatus.cancelled) {
  //       emit(GoogleLoginFailure(message: 'Sign-in cancelled'));
  //       return;
  //     } else if (loginResult.status == LoginStatus.failed) {
  //       emit(GoogleLoginFailure(message: 'Sign-in failed'));
  //       return;
  //     }
  //     // Create a credential from the access token
  //     final OAuthCredential facebookAuthCredential =
  //         FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  //     // Once signed in, return the UserCredential
  //     await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  //     emit(GoogleLoginSuccess());
  //   } catch (e) {
  //     emit(GoogleLoginFailure(message: e.toString()));
  //   }
  // }
}
