import 'package:firebase_auth/firebase_auth.dart';
import 'package:football_not_soccer/core/authentication/authentication_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({required this.authService});

  Future<User?> signInWithGoogle() async {
    return authService.signInWithGoogle();
  }

  Future<User?> signInWithFb() async {
    return authService.signInWithFacebook();
  }

  Future<void> signInWithCredentials(String email, String password) {
    return authService.signInWithEmail(email, password);
  }

  Future signOut() async {
    await authService.signOut();
  }

  Future<bool> isSignedIn() async {
    final currentUser = authService.user;
    return currentUser != null;
  }

  Future<String?> getUser() async {
    return (authService.user)!.email;
  }
}
