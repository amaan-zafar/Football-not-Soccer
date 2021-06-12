import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;
import 'package:football_not_soccer/config/icons/app_icons_icons.dart';
import 'package:football_not_soccer/core/leagues/standings/bloc/standings_bloc.dart';
import 'package:football_not_soccer/core/leagues/standings/standings_model.dart';

class StandingsScreen extends StatefulWidget {
  final String leagueCode;
  final String leagueLogo;

  const StandingsScreen(
      {Key? key, required this.leagueCode, required this.leagueLogo})
      : super(key: key);
  @override
  _StandingsScreenState createState() => _StandingsScreenState();
}

class _StandingsScreenState extends State<StandingsScreen> {
  List<DataRow> _rows = [];

  @override
  Widget build(BuildContext context) {
    final standingsBloc = BlocProvider.of<StandingsBloc>(context);
    standingsBloc.add(GetStandings(leagueCode: widget.leagueCode));
    return Scaffold(body: BlocBuilder<StandingsBloc, StandingsState>(
      builder: (context, state) {
        // if (state is StandingsLoading)
        //   return TableBody(rows: _rows);
        if (state is StandingsLoaded) {
          List<LeagueTable> table =
              state.standingsModel.standings[0].leagueTable;
          table.forEach((element) {
            _rows.add(DataRow(
              cells: <DataCell>[
                DataCell(Text(element.position.toString())),
                DataCell(Text(element.team.name)),
                DataCell(Text(element.playedGames.toString())),
                DataCell(Text(element.won.toString())),
                DataCell(Text(element.draw.toString())),
                DataCell(Text(element.lost.toString())),
                DataCell(Text(element.points.toString())),
              ],
            ));
          });
          return TableBody(
            rows: _rows,
            competition: state.standingsModel.competition,
            leagueLogo: widget.leagueLogo,
          );
        }
        //  else if (state is StandingsError) return TableBody(rows: _rows);
        return Container();
      },
    ));
  }
}

class TableBody extends StatelessWidget {
  const TableBody(
      {Key? key,
      required this.rows,
      required this.competition,
      required this.leagueLogo})
      : super(key: key);

  final List<DataRow> rows;
  final Competition competition;
  final String leagueLogo;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton(
              icon: Icon(AppIcons.arrow___left_2), onPressed: () => {}
              // Navigator.of(context).pop(),
              ),
          title: Text(competition.country,
              style: Theme.of(context).textTheme.headline5),
          pinned: true,
          expandedHeight: 200,
          // stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              leagueLogo,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: DataTable(
          columnSpacing: 8,
          columns: [
            DataColumn(label: Text('#')),
            DataColumn(label: Text('Team')),
            DataColumn(label: Text('P')),
            DataColumn(label: Text('W')),
            DataColumn(label: Text('D')),
            DataColumn(label: Text('L')),
            DataColumn(label: Text('Pts.')),
          ],
          rows: rows,
        )),
      ],
    );
  }
}

class MatchFilters extends StatelessWidget {
  const MatchFilters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23),
              topRight: Radius.circular(23),
              bottomLeft: Radius.circular(23),
              bottomRight: Radius.circular(23),
            ),
            gradient: LinearGradient(
                begin: Alignment(0.498113214969635, 0.5433962345123291),
                end: Alignment(-0.5433962345123291, 0.498113214969635),
                colors: [
                  Color.fromRGBO(244, 165, 138, 1),
                  Color.fromRGBO(237, 107, 78, 1)
                ]),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'All',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Source Sans Pro',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23),
              topRight: Radius.circular(23),
              bottomLeft: Radius.circular(23),
              bottomRight: Radius.circular(23),
            ),
            gradient: LinearGradient(
                begin: Alignment(0.498113214969635, 0.5433962345123291),
                end: Alignment(-0.5433962345123291, 0.498113214969635),
                colors: [
                  Color.fromRGBO(244, 165, 138, 1),
                  Color.fromRGBO(237, 107, 78, 1)
                ]),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Home',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Source Sans Pro',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23),
              topRight: Radius.circular(23),
              bottomLeft: Radius.circular(23),
              bottomRight: Radius.circular(23),
            ),
            gradient: LinearGradient(
                begin: Alignment(0.498113214969635, 0.5433962345123291),
                end: Alignment(-0.5433962345123291, 0.498113214969635),
                colors: [
                  Color.fromRGBO(244, 165, 138, 1),
                  Color.fromRGBO(237, 107, 78, 1)
                ]),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Away',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Source Sans Pro',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LeagueName extends StatelessWidget {
  const LeagueName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'La Liga',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1),
          fontFamily: 'Source Sans Pro',
          fontSize: 24,
          letterSpacing:
              0 /*percentages not used in flutter. defaulting to zero*/,
          fontWeight: FontWeight.normal,
          height: 1),
    );
  }
}

class LeagueLogo extends StatelessWidget {
  const LeagueLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: ClipOval(
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: -33,
              child: Container(
                  width: 166,
                  height: 111,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Image129.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: -20,
              left: -10,
              child: Container(
                  width: 120,
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Image130.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: -11,
              left: -9.220458984375,
              child: Transform.rotate(
                angle: -8.669304904009042 * (math.pi / 180),
                child: Container(
                    width: 136.1343231201172,
                    height: 204.20147705078125,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Image131.png'),
                          fit: BoxFit.fitWidth),
                    )),
              )),
        ]),
      ),
    );
  }
}
