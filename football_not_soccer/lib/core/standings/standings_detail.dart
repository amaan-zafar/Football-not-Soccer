import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:football_not_soccer/config/icons/app_icons_icons.dart';

class StandingsdetailWidget extends StatefulWidget {
  @override
  _StandingsdetailWidgetState createState() => _StandingsdetailWidgetState();
}

class _StandingsdetailWidgetState extends State<StandingsdetailWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator StandingsdetailWidget - FRAME

    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(icon: Icon(AppIcons.arrow___left_2), onPressed: () => {}
                // Navigator.of(context).pop(),
                ),
        title: Text(
          '🇪🇸 Spain',
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Source Sans Pro',
              fontSize: 16,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.3125),
        ),
      ),
      body: Stack(children: <Widget>[]),
    );
  }
}

class ColumnHeadings extends StatelessWidget {
  const ColumnHeadings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 318.9999084472656,
        height: 30,
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 27.999902725219727,
              child: Text(
                'Team',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Source Sans Pro',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 2.0714285714285716),
              )),
          Positioned(
              top: 0,
              left: 8.99990177154541,
              child: Text(
                '#',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Source Sans Pro',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 2.0714285714285716),
              )),
          Positioned(
              top: 0,
              left: 163.9998779296875,
              child: Text(
                'D',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Source Sans Pro',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 2.0714285714285716),
              )),
          Positioned(
              top: 0,
              left: 190.9998779296875,
              child: Text(
                'L',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Source Sans Pro',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 2.0714285714285716),
              )),
          Positioned(
              top: 0,
              left: 215.9998779296875,
              child: Text(
                'Ga',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Source Sans Pro',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 2.0714285714285716),
              )),
          Positioned(
              top: 0,
              left: 249.9998779296875,
              child: Text(
                'Gd',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Source Sans Pro',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 2.0714285714285716),
              )),
          Positioned(
              top: 0,
              left: 284.9998779296875,
              child: Text(
                'Pts',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Source Sans Pro',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 2.0714285714285716),
              )),
          Positioned(
              top: 28.97289276123047,
              left: 319,
              child: Transform.rotate(
                angle: -179.81552107384994 * (math.pi / 180),
                child:
                    Divider(color: Color.fromRGBO(42, 42, 60, 1), thickness: 1),
              )),
        ]));
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
