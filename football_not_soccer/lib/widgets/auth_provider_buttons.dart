import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart'
    show
        GoogleAuthButton,
        FacebookAuthButton,
        AuthButtonStyle,
        AuthButtonType,
        AuthIconType;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_not_soccer/core/authentication/bloc/authentication_bloc.dart';

class AuthProviderButtons extends StatelessWidget {
  AuthProviderButtons({Key? key}) : super(key: key);

  User? firebaseUser;
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GoogleAuthButton(
              onPressed: () async {
                firebaseUser = await authBloc.authRepository.signInWithGoogle();
                print('firebaseuser is $firebaseUser');
              },
              darkMode: true,
              isLoading: false,
              style: const AuthButtonStyle(
                buttonType: AuthButtonType.secondary,
                iconType: AuthIconType.outlined,
              ),
            ),
            SizedBox(height: 16),
            FacebookAuthButton(
              onPressed: () async {
                await authBloc.authRepository.signInWithFb();
              },
              darkMode: true,
              isLoading: false,
              style: const AuthButtonStyle(
                buttonType: AuthButtonType.secondary,
                iconType: AuthIconType.outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
