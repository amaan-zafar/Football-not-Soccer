import 'package:flutter/material.dart';
import 'package:football_not_soccer/core/leagues/competitions/league_container.dart';

import '../standings/standings_screen.dart';

class CompetitionsScreen extends StatelessWidget {
  const CompetitionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 20),
              Text(
                'Competitions',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.2),
                child: GridView.count(
                  crossAxisCount: width > 1000
                      ? 4
                      : width > 700
                          ? 3
                          : 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                  children: [
                    GestureDetector(
                      child: LeagueContainer(
                          image: 'assets/images/bundesliga.png'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => StandingsScreen(
                                      leagueCode: 'BL1',
                                      leagueLogo:
                                          'assets/images/bundesliga.png',
                                    )));
                      },
                    ),
                    GestureDetector(
                      child: LeagueContainer(image: 'assets/images/laliga.png'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => StandingsScreen(
                                      leagueCode: 'PD',
                                      leagueLogo: 'assets/images/laliga.png',
                                    )));
                      },
                    ),
                    GestureDetector(
                      child: LeagueContainer(image: 'assets/images/ligue1.png'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => StandingsScreen(
                                      leagueCode: 'FL1',
                                      leagueLogo: 'assets/images/ligue1.png',
                                    )));
                      },
                    ),
                    GestureDetector(
                      child: LeagueContainer(image: 'assets/images/nos.png'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => StandingsScreen(
                                      leagueCode: 'PPL',
                                      leagueLogo: 'assets/images/nos.png',
                                    )));
                      },
                    ),
                    GestureDetector(
                      child: LeagueContainer(image: 'assets/images/pl.png'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => StandingsScreen(
                                      leagueCode: 'PL',
                                      leagueLogo: 'assets/images/pl.png',
                                    )));
                      },
                    ),
                    GestureDetector(
                      child: LeagueContainer(image: 'assets/images/seria.png'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => StandingsScreen(
                                      leagueCode: 'SA',
                                      leagueLogo: 'assets/images/seria.png',
                                    )));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
