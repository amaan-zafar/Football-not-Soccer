import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:football_not_soccer/core/authentication/auth_repo.dart';
import 'package:football_not_soccer/core/authentication/bloc/authentication_event.dart';
import 'package:football_not_soccer/core/authentication/bloc/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;
  AuthenticationBloc({required this.authRepository}) : super(Uninitialized());

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await authRepository.isSignedIn();
      if (isSignedIn) {
        final name = await authRepository.getUser();
        yield Authenticated(displayName: name!);
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    final name = await authRepository.getUser();
    yield Authenticated(displayName: name!);
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    authRepository.signOut();
  }
}
