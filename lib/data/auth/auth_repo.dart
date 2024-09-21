import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  AuthRepository() {
    _auth = FirebaseAuth.instance;
  }

  late final FirebaseAuth _auth;

  void registerUser({
    required String email,
    required String password,
  }) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
