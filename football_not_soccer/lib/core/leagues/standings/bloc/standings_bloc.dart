import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'standings_event.dart';
part 'standings_state.dart';

class StandingsBloc extends Bloc<StandingsEvent, StandingsState> {
  StandingsBloc() : super(StandingsInitial());

  @override
  Stream<StandingsState> mapEventToState(
    StandingsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
