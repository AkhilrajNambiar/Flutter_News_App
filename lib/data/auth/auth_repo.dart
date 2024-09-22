import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_feed_app/data/preferences.dart';

class AuthRepository {
  AuthRepository({required PreferenceManager preferenceManager}) {
    _auth = FirebaseAuth.instance;
    _preferenceManager = preferenceManager;
  }

  late final FirebaseAuth _auth;
  late final PreferenceManager _preferenceManager;

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    var credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await _preferenceManager.setUid(credential.user?.uid ?? '');
    await _preferenceManager.setUsername(email);
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    var credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    await _preferenceManager.setUid(credential.user?.uid ?? '');
    await _preferenceManager.setUsername(email);
  }

  bool isUserLoggedIn() => _preferenceManager.getUid().isNotEmpty;

  Future<void> logout() => _preferenceManager.logout();
}
