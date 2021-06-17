import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth
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

  Future<User?> signInWithAuthCredential(OAuthCredential credential) async {
    User? _user;
    try {
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      _user = userCredential.user;
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
    return _user;
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    // Holds fields describing a signed in user's identity
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    if (googleSignInAccount != null) {
      // Holds authentication tokens after sign in.
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      // Passing credentials obtained from google-sign-in to firebase_auth;
      // represents the credentials returned by an auth provider.
      final googleAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);

      return signInWithAuthCredential(googleAuthCredential);
    }
  }

  Future<User?> signInWithFacebook() async {
    // Trigger the sign-in flow
    final AccessToken result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final facebookAuthCredential =
        FacebookAuthProvider.credential(result.token);

    return signInWithAuthCredential(facebookAuthCredential);
  }

  Future<User?> signInWithTwitter() async {
    // Create a TwitterLogin instance
    final TwitterLogin twitterLogin = new TwitterLogin(
      consumerKey: 'C4AGLUZpdko31BWmGOiMdFF7m',
      consumerSecret: '1xRCiyl8wInTfb9tNLQDHVuDiPyOG5ZJRr2nB33IvrSHrY93Eg',
    );

    // Trigger the sign-in flow
    final TwitterLoginResult loginResult = await twitterLogin.authorize();

    // Get the Logged In session
    final TwitterSession twitterSession = loginResult.session;

    // Create a credential from the access token
    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: twitterSession.token,
      secret: twitterSession.secret,
    );

    return signInWithAuthCredential(twitterAuthCredential);
  }
}
