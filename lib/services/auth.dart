import 'package:firebase_auth/firebase_auth.dart';




abstract class AuthBase {
  Future<void> signInWithEmailAndPasswords(String email, String password);

  Future<void> createUserWithEmailAndPasswords(String email, String password);

  Future<void> signOut();
}

class Auth implements AuthBase {
  static final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signInWithEmailAndPasswords(
      String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> createUserWithEmailAndPasswords(
      String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
