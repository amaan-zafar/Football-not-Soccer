class StandingsModel {
  Competition competition;
  Season season;
  List<Standings> standings;

  StandingsModel(
      {required this.competition,
      required this.season,
      required this.standings});

  factory StandingsModel.fromJson(Map<String, dynamic> json) {
    List<Standings> standings = [];
    json['standings'].forEach((v) {
      standings.add(new Standings.fromJson(v));
    });
    return StandingsModel(
        competition: Competition.fromJson(json['competition']),
        season: Season.fromJson(json['season']),
        standings: standings);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['competition'] = this.competition.toJson();
    data['season'] = this.season.toJson();
    data['standings'] = this.standings.map((v) => v.toJson()).toList();
    return data;
  }
}

class Competition {
  String country;
  String name;
  String code;

  Competition({required this.country, required this.name, required this.code});

  factory Competition.fromJson(Map<String, dynamic> json) {
    return Competition(
        country: json['area']['name'], name: json['name'], code: json['code']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area']['name'] = this.country;
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}

class Season {
  int id;
  String startDate;
  String endDate;
  int currentMatchday;
  Null winner;

  Season(
      {required this.id,
      required this.startDate,
      required this.endDate,
      required this.currentMatchday,
      required this.winner});

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
        id: json['id'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        currentMatchday: json['currentMatchday'],
        winner: json['winner']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['currentMatchday'] = this.currentMatchday;
    data['winner'] = this.winner;
    return data;
  }
}

class Standings {
  String type;
  List<LeagueTable> leagueTable;

  Standings({required this.type, required this.leagueTable});

  factory Standings.fromJson(Map<String, dynamic> json) {
    List<LeagueTable> table = [];
    json['table'].forEach((v) {
      table.add(LeagueTable.fromJson(v));
    });
    return Standings(
      type: json['type'],
      leagueTable: table,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['table'] = this.leagueTable.map((v) => v.toJson()).toList();
    return data;
  }
}

class LeagueTable {
  int position;
  Team team;
  int playedGames;
  String form;
  int won;
  int draw;
  int lost;
  int points;
  int goalsFor;
  int goalsAgainst;
  int goalDifference;

  LeagueTable(
      {required this.position,
      required this.team,
      required this.playedGames,
      required this.form,
      required this.won,
      required this.draw,
      required this.lost,
      required this.points,
      required this.goalsFor,
      required this.goalsAgainst,
      required this.goalDifference});

  factory LeagueTable.fromJson(Map<String, dynamic> json) {
    return LeagueTable(
        position: json['position'],
        team: Team.fromJson(json['team']),
        playedGames: json['playedGames'],
        form: json['form'],
        won: json['won'],
        draw: json['draw'],
        lost: json['lost'],
        points: json['points'],
        goalsFor: json['goalsFor'],
        goalsAgainst: json['goalsAgainst'],
        goalDifference: json['goalDifference']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    data['team'] = this.team.toJson();
    data['playedGames'] = this.playedGames;
    data['form'] = this.form;
    data['won'] = this.won;
    data['draw'] = this.draw;
    data['lost'] = this.lost;
    data['points'] = this.points;
    data['goalsFor'] = this.goalsFor;
    data['goalsAgainst'] = this.goalsAgainst;
    data['goalDifference'] = this.goalDifference;
    return data;
  }
}

class Team {
  int id;
  String name;
  String crestUrl;

  Team({required this.id, required this.name, required this.crestUrl});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      crestUrl: json['crestUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['crestUrl'] = this.crestUrl;
    return data;
  }
}
