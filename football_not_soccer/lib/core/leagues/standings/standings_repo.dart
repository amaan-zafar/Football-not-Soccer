import 'package:football_not_soccer/network/api_base_helper.dart';

class StandingsRepository {
  final ApiProvider apiProvider;

  StandingsRepository({required this.apiProvider});

  @override
  Future<List<String>> fetchStandings({required String leagueCode}) async {
    final response = await apiProvider.get(
        'competitions/$leagueCode/standings?standingType=TOTAL',
        requireApiKey: true);
    return response;
  }
}
