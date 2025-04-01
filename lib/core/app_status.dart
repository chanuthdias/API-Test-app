import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_api_app/core/firebase_service.dart';
import 'package:movie_api_app/core/service_locator.dart';

class AppStatus with ChangeNotifier {
  final FirebaseService _firebaseService = getIt<FirebaseService>();
  User? _user;
  bool _isLoggedIn = false;

  AppStatus() {
    _firebaseService.authStateChanges.listen((User? user) {
      _user = user;
      _isLoggedIn = user != null;
      notifyListeners();
    });
  }

  bool get isLoggedIn => _isLoggedIn;
  User? get user => _user;

  Future<void> logout() async {
    await _firebaseService.signOut();
  }
}
