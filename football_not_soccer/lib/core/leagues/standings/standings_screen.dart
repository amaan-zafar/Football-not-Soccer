import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_not_soccer/config/icons/app_icons_icons.dart';
import 'package:football_not_soccer/constants/colors.dart';
import 'package:football_not_soccer/core/leagues/standings/bloc/standings_bloc.dart';
import 'package:football_not_soccer/core/leagues/standings/loading_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    final standingsBloc = BlocProvider.of<StandingsBloc>(context);
    standingsBloc.add(GetStandings(leagueCode: widget.leagueCode));
    return Scaffold(body: BlocBuilder<StandingsBloc, StandingsState>(
      builder: (context, state) {
        if (state is StandingsLoading) return LoadingListPage();
        if (state is StandingsLoaded) {
          return TableBody(
            standingsModel: state.standingsModel,
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
  TableBody({Key? key, required this.standingsModel, required this.leagueLogo})
      : super(key: key);

  final StandingsModel standingsModel;
  final String leagueLogo;
  List<DataRow> _rows = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    List<LeagueTable> table = standingsModel.standings[0].leagueTable;
    _rows = [];
    table.forEach((element) {
      int position = element.position;
      _rows.add(DataRow(
        cells: <DataCell>[
          DataCell(Text(position.toString())),
          DataCell(Row(
            children: [
              SvgPicture.network(
                element.team.crestUrl,
                height: 24,
                width: 24,
              ),
              SizedBox(width: 4),
              Text(element.team.name),
            ],
          )),
          DataCell(Text(element.playedGames.toString())),
          DataCell(Text(element.won.toString())),
          DataCell(Text(element.draw.toString())),
          DataCell(Text(element.lost.toString())),
          DataCell(Text(element.goalsFor.toString())),
          DataCell(Text(element.goalsAgainst.toString())),
          DataCell(Text(element.goalDifference.toString())),
          DataCell(Text(element.points.toString())),
          DataCell(Text(element.form.replaceAll(',', ''))),
        ],
        color: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          // if (states.contains(MaterialState.selected))
          //   return Theme.of(context).colorScheme.primary.withOpacity(0.08);
          return (position == 1 || position == 2 || position == 3)
              ? AppColors.darkBlue
              : (position == 4 || position == 5)
                  ? AppColors.brown1
                  : AppColors.black2; // Use the default value.
        }),
      ));
    });
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton(
              icon: Icon(AppIcons.arrow___left_2),
              onPressed: () => Navigator.pop(context)
              // Navigator.of(context).pop(),
              ),
          title: Text(standingsModel.competition.country,
              style: Theme.of(context).textTheme.headline5),
          pinned: true,
          expandedHeight: 220,
          // stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 64,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      leagueLogo,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: width > 700 ? 40 : 8,
                columns: [
                  DataColumn(label: Text('#')),
                  DataColumn(label: Text('Team')),
                  DataColumn(label: Text('P')),
                  DataColumn(label: Text('W')),
                  DataColumn(label: Text('D')),
                  DataColumn(label: Text('L')),
                  DataColumn(label: Text('GF')),
                  DataColumn(label: Text('GA')),
                  DataColumn(label: Text('GD')),
                  DataColumn(label: Text('Pts.')),
                  DataColumn(label: Text('Last 5')),
                ],
                rows: _rows,
              ),
            ),
          ),
        )),
      ],
    );
  }
}
