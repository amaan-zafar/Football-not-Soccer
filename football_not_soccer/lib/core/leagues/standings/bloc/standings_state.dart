part of 'standings_bloc.dart';

abstract class StandingsState extends Equatable {
  const StandingsState();

  @override
  List<Object> get props => [];
}

class StandingsInitial extends StandingsState {}

class StandingsLoading extends StandingsState {
  final String message;

  const StandingsLoading({required this.message});
  @override
  List<Object> get props => [message];
}

class StandingsLoaded extends StandingsState {
  final StandingsModel standingsModel;

  const StandingsLoaded({required this.standingsModel});
  @override
  List<Object> get props => [standingsModel];
}

class StandingsError extends StandingsState {
  final String message;

  const StandingsError({required this.message});
  @override
  List<Object> get props => [message];
}
