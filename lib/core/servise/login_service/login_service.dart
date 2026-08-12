abstract class LoginService {
  Future createAccountWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future logInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
