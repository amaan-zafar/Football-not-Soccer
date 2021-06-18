import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_not_soccer/core/authentication/bloc/authentication_bloc.dart';
import 'package:football_not_soccer/core/authentication/bloc/authentication_state.dart';
import 'package:football_not_soccer/core/authentication/bloc/authentication_event.dart';
import 'package:football_not_soccer/core/authentication/sign_in_screen.dart';
import 'package:football_not_soccer/core/authentication/sign_up_screen.dart';
import 'package:football_not_soccer/core/root/root_screen.dart';
import 'package:football_not_soccer/widgets/splash_screen.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    authBloc.add(AppStarted());
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is Uninitialized)
          return SplashScreen();
        else if (state is Authenticated)
          return RootScreen();
        else if (state is Unauthenticated) return SignInScreen();
        return Container();
      },
    );
  }
}
