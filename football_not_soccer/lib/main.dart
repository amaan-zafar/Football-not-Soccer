import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_not_soccer/config/themes/dark_theme.dart';
import 'package:football_not_soccer/constants/strings.dart';
import 'package:football_not_soccer/core/leagues/standings/standings_repo.dart';
import 'package:football_not_soccer/core/root/root_screen.dart';
import 'package:football_not_soccer/network/api_base_helper.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:http/http.dart' as http;

import 'core/leagues/standings/bloc/standings_bloc.dart';

void main() {
  final http.Client _client = http.Client();
  final StandingsRepository _standingsRepository =
      StandingsRepository(apiProvider: ApiProvider(httpClient: _client));
  runApp(MyApp(
    standingsRepository: _standingsRepository,
  ));
}

class MyApp extends StatelessWidget {
  final StandingsRepository standingsRepository;
  const MyApp({Key? key, required this.standingsRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          StandingsBloc(standingsRepository: standingsRepository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.APP_LABEL,
        theme: DarkTheme.darkTheme,
        home: RootScreen(),
      ),
    );
  }
}
