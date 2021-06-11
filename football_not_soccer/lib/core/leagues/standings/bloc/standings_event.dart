part of 'standings_bloc.dart';

abstract class StandingsEvent extends Equatable {
  const StandingsEvent();

  @override
  List<Object> get props => [];
}

class GetStandings extends StandingsEvent {
  final String leagueCode;

  GetStandings({required this.leagueCode});
  @override
  List<Object> get props => [];
}
