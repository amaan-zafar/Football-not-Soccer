import 'package:flutter/material.dart';
import 'package:football_not_soccer/core/leagues/competitions/league_container.dart';

import '../standings_screen.dart';

class CompetitionsScreen extends StatelessWidget {
  const CompetitionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 32,
                mainAxisSpacing: 32,
                children: [
                  GestureDetector(
                    child:
                        LeagueContainer(image: 'assets/images/bundesliga.png'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => StandingsScreen(
                                    leagueCode: 'BL1',
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
                                  )));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
