import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;
  final FacebookAuth facebookAuth;
  User? user;

  AuthService(
      {required this.auth,
      required this.googleSignIn,
      required this.facebookAuth});

  Stream<User?> get authStateChanges => auth.authStateChanges();

  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          print('Firebase error : ${e.code}');
          break;
        case 'invalid-email':
          print('Firebase error : ${e.code}');
          break;
        case 'operation-not-allowed':
          print('Firebase error : ${e.code}');
          break;
        case 'weak-password':
          print('Firebase error : ${e.code}');
          break;
        default:
      }
    } catch (e) {
      print('Non-firebase error : ${e.toString()}');
    }
    return user;
  }

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          print('Firebase error : ${e.code}');
          break;
        case 'invalid-email':
          print('Firebase error : ${e.code}');
          break;
        case 'operation-not-allowed':
          print('Firebase error : ${e.code}');
          break;
        case 'weak-password':
          print('Firebase error : ${e.code}');
          break;
        default:
      }
    } catch (e) {
      print('Non-firebase error : ${e.toString()}');
    }
    return user;
  }

  Future<User?> signInWithSocialAuthCredential(
      OAuthCredential credential) async {
    try {
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      print('user cred is $userCredential');
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          print('Firebase error : ${e.code}');
          break;
        case 'invalid-email':
          print('Firebase error : ${e.code}');
          break;
        case 'operation-not-allowed':
          print('Firebase error : ${e.code}');
          break;
        case 'weak-password':
          print('Firebase error : ${e.code}');
          break;
        default:
      }
    } catch (e) {
      print('Non-firebase error : ${e.toString()}');
    }
    // Once signed in, return the UserCredential
    return user;
  }

  Future<User?> signInWithGoogle() async {
    // Holds fields describing a signed in user's identity
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      // Holds authService tokens after sign in.
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      print('signinauth is ${googleSignInAuthentication.accessToken}');

      // Passing credentials obtained from google-sign-in to firebase_auth;
      // represents the credentials returned by an auth provider.
      final googleAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);

      return signInWithSocialAuthCredential(googleAuthCredential);
    } else {
      print('GoogleSignInAccount returned null');
    }
  }

  String prettyPrint(Map json) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String pretty = encoder.convert(json);
    return pretty;
  }

  void _printCredentials(AccessToken accessToken) {
    print('Access token is ${prettyPrint(accessToken.toJson())}');
  }

  Future<User?> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult result =
        await facebookAuth.login(loginBehavior: LoginBehavior.dialogOnly);

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      _printCredentials(accessToken);
      final userData = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      print(userData);
      final facebookAuthCredential =
          FacebookAuthProvider.credential(accessToken.token);
      return signInWithSocialAuthCredential(facebookAuthCredential);
    } else {
      print(result.status);
      print(result.message);
    }
  }

  Future<void> signOut() async {
    if (auth.currentUser != null) {
      switch (auth.currentUser!.providerData[0].providerId) {
        case 'google.com':
          // signOut will sign out and on signing again, will silently sign in
          // await _googleSignIn.signOut();
          // disconnect will sign out and disconnect; on signing in again, will ask which account to sign in from
          await googleSignIn.disconnect();
          break;
        case 'facebook.com':
          await facebookAuth.logOut();
          break;
        default:
      }
      await auth.signOut();
    } else {
      print('No auth user signed in');
    }
  }
}



  // Future<User?> signInWithTwitter() async {
  //   // Create a TwitterLogin instance
  //   final TwitterLogin twitterLogin = new TwitterLogin(
  //     consumerKey: 'C4AGLUZpdko31BWmGOiMdFF7m',
  //     consumerSecret: '1xRCiyl8wInTfb9tNLQDHVuDiPyOG5ZJRr2nB33IvrSHrY93Eg',
  //   );

  //   // Trigger the sign-in flow
  //   final TwitterLoginResult loginResult = await twitterLogin.authorize();

  //   // Get the Logged In session
  //   final TwitterSession twitterSession = loginResult.session;

  //   // Create a credential from the access token
  //   final twitterAuthCredential = TwitterAuthProvider.credential(
  //     accessToken: twitterSession.token,
  //     secret: twitterSession.secret,
  //   );

  //   return signInWithSocialAuthCredential(twitterAuthCredential);
  // }