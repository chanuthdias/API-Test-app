import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //  For firebase password reset
  // Future<void> confirmPasswordReset(String code, String newPassword) async {
  //   await _auth.confirmPasswordReset(code: code, newPassword: newPassword);
  // }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
