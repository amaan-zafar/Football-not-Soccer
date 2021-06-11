import 'package:football_not_soccer/core/leagues/standings/table_position_model.dart';
import 'package:football_not_soccer/network/api_base_helper.dart';

class StandingsRepository {
  final ApiProvider apiProvider;

  StandingsRepository({required this.apiProvider});

  @override
  Future<List<TablePosition>> fetchStandings(
      {required String leagueCode}) async {
    final response = await apiProvider.get('competitions/$leagueCode/standings',
        requireApiKey: true);
    return response;
  }
}
