class TablePosition {
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

  TablePosition(
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

  factory TablePosition.fromJson(Map<String, dynamic> json) {
    return TablePosition(
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
      goalDifference: json['goalDifference'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    if (this.team != null) {
      data['team'] = this.team.toJson();
    }
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
    return Team(id: json['id'], name: json['name'], crestUrl: json['crestUrl']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['crestUrl'] = this.crestUrl;
    return data;
  }
}
