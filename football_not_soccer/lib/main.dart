import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:football_not_soccer/config/themes/dark_theme.dart';
import 'package:football_not_soccer/constants/strings.dart';
import 'package:football_not_soccer/core/authentication/auth_repo.dart';
import 'package:football_not_soccer/core/authentication/authentication_service.dart';
import 'package:football_not_soccer/core/authentication/authentication_wrapper.dart';
import 'package:football_not_soccer/core/authentication/bloc/authentication_bloc.dart';
import 'package:football_not_soccer/core/leagues/standings/bloc/bloc_observer.dart';
import 'package:football_not_soccer/core/leagues/standings/standings_repo.dart';
import 'package:football_not_soccer/network/api_base_helper.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'core/leagues/standings/bloc/standings_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Since flutter firebase needs to interact with native platfors, ensureInitialized is required
  await Firebase.initializeApp();
  // check if is running on Web
  if (kIsWeb) {
    // initialiaze the facebook javascript SDK
    FacebookAuth.i.webInitialize(
      appId: "2970455933224711", //<-- YOUR APP_ID
      cookie: true,
      xfbml: true,
      version: "v9.0",
    );
  }
  Bloc.observer = SimpleBlocObserver();

  final http.Client _client = http.Client();
  final StandingsRepository _standingsRepository =
      StandingsRepository(apiProvider: ApiProvider(httpClient: _client));
  final AuthRepository _authRepository = AuthRepository(
      authService: AuthService(
          auth: FirebaseAuth.instance,
          googleSignIn: GoogleSignIn(),
          facebookAuth: FacebookAuth.instance));
  runApp(MyApp(
    standingsRepository: _standingsRepository,
    authRepository: _authRepository,
  ));
}

class MyApp extends StatelessWidget {
  final StandingsRepository standingsRepository;
  final AuthRepository authRepository;
  const MyApp(
      {Key? key,
      required this.standingsRepository,
      required this.authRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              StandingsBloc(standingsRepository: standingsRepository),
        ),
        BlocProvider(
          create: (context) =>
              AuthenticationBloc(authRepository: authRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.APP_LABEL,
        theme: DarkTheme.darkTheme,
        home: AuthenticationWrapper(),
      ),
    );
  }
}
