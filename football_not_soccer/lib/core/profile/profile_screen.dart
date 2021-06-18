import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_not_soccer/constants/strings.dart';
import 'package:football_not_soccer/core/authentication/bloc/authentication_bloc.dart';
import 'package:football_not_soccer/core/authentication/bloc/authentication_event.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppStrings.PROFILE),
            MaterialButton(
              onPressed: () async {
                await authBloc.authRepository.signOut();
                authBloc.add(LoggedOut());
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
