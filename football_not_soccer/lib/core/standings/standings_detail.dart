import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:football_not_soccer/config/icons/app_icons_icons.dart';
import 'package:football_not_soccer/constants/colors.dart';

class StandingsdetailWidget extends StatefulWidget {
  @override
  _StandingsdetailWidgetState createState() => _StandingsdetailWidgetState();
}

class _StandingsdetailWidgetState extends State<StandingsdetailWidget> {
  List<DataRow> _rows = [
    DataRow(
      cells: <DataCell>[
        DataCell(Text('1')),
        DataCell(Text('Atletico Madrid')),
        DataCell(Text('14')),
        DataCell(Text('7')),
        DataCell(Text('5')),
        DataCell(Text('2')),
        DataCell(Text('26')),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(Text('2')),
        DataCell(Text('Real Madrid')),
        DataCell(Text('14')),
        DataCell(Text('7')),
        DataCell(Text('5')),
        DataCell(Text('2')),
        DataCell(Text('26')),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(Text('2')),
        DataCell(Text('Real Madrid')),
        DataCell(Text('14')),
        DataCell(Text('7')),
        DataCell(Text('5')),
        DataCell(Text('2')),
        DataCell(Text('26')),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(Text('2')),
        DataCell(Text('Real Madrid')),
        DataCell(Text('14')),
        DataCell(Text('7')),
        DataCell(Text('5')),
        DataCell(Text('2')),
        DataCell(Text('26')),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(Text('2')),
        DataCell(Text('Real Madrid')),
        DataCell(Text('14')),
        DataCell(Text('7')),
        DataCell(Text('5')),
        DataCell(Text('2')),
        DataCell(Text('26')),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(Text('2')),
        DataCell(Text('Real Madrid')),
        DataCell(Text('14')),
        DataCell(Text('7')),
        DataCell(Text('5')),
        DataCell(Text('2')),
        DataCell(Text('26')),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(Text('2')),
        DataCell(Text('Real Madrid')),
        DataCell(Text('14')),
        DataCell(Text('7')),
        DataCell(Text('5')),
        DataCell(Text('2')),
        DataCell(Text('26')),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(Text('2')),
        DataCell(Text('Real Madrid')),
        DataCell(Text('14')),
        DataCell(Text('7')),
        DataCell(Text('5')),
        DataCell(Text('2')),
        DataCell(Text('26')),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(Text('2')),
        DataCell(Text('Real Madrid')),
        DataCell(Text('14')),
        DataCell(Text('7')),
        DataCell(Text('5')),
        DataCell(Text('2')),
        DataCell(Text('26')),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(Text('2')),
        DataCell(Text('Real Madrid')),
        DataCell(Text('14')),
        DataCell(Text('7')),
        DataCell(Text('5')),
        DataCell(Text('2')),
        DataCell(Text('26')),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(Text('2')),
        DataCell(Text('Real Madrid')),
        DataCell(Text('14')),
        DataCell(Text('7')),
        DataCell(Text('5')),
        DataCell(Text('2')),
        DataCell(Text('26')),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(Text('2')),
        DataCell(Text('Real Madrid')),
        DataCell(Text('14')),
        DataCell(Text('7')),
        DataCell(Text('5')),
        DataCell(Text('2')),
        DataCell(Text('26')),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(Text('2')),
        DataCell(Text('Real Madrid')),
        DataCell(Text('14')),
        DataCell(Text('7')),
        DataCell(Text('5')),
        DataCell(Text('2')),
        DataCell(Text('26')),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(Text('2')),
        DataCell(Text('Real Madrid')),
        DataCell(Text('14')),
        DataCell(Text('7')),
        DataCell(Text('5')),
        DataCell(Text('2')),
        DataCell(Text('26')),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator StandingsdetailWidget - FRAME

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
                icon: Icon(AppIcons.arrow___left_2), onPressed: () => {}
                // Navigator.of(context).pop(),
                ),
            title: Text('🇪🇸 Spain',
                style: Theme.of(context).textTheme.headline5),
            pinned: true,
            expandedHeight: 200,
            // stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  'https://i.cdn.newsbytesapp.com/images/l147_9221595405241.jpg',
                  fit: BoxFit.cover),
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
            rows: _rows,
          )),
        ],
      ),
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
