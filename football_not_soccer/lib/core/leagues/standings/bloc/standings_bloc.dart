import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:football_not_soccer/core/leagues/standings/standings_repo.dart';
import 'package:football_not_soccer/core/leagues/standings/standings_model.dart';

part 'standings_event.dart';
part 'standings_state.dart';

class StandingsBloc extends Bloc<StandingsEvent, StandingsState> {
  final StandingsRepository standingsRepository;

  StandingsBloc({required this.standingsRepository})
      : super(StandingsInitial());

  @override
  Stream<StandingsState> mapEventToState(
    StandingsEvent event,
  ) async* {
    if (event is GetStandings) {
      yield StandingsLoading(message: 'Fetching Jokes Categories...');
      try {
        final StandingsModel standingsModel = await standingsRepository
            .fetchStandings(leagueCode: event.leagueCode);
        yield StandingsLoaded(standingsModel: standingsModel);
      } catch (e) {
        yield StandingsError(message: 'Error: ${e.toString()}');
      }
    }
  }
}
