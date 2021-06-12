import 'package:football_not_soccer/core/leagues/standings/standings_model.dart';
import 'package:football_not_soccer/network/api_base_helper.dart';

class StandingsRepository {
  final ApiProvider apiProvider;

  StandingsRepository({required this.apiProvider});

  Future<StandingsModel> fetchStandings({required String leagueCode}) async {
    final response = await apiProvider.get('competitions/$leagueCode/standings',
        requireApiKey: true);
    return StandingsModel.fromJson(response);
  }
}
