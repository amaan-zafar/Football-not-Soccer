import 'package:flutter/material.dart';
import 'package:football_not_soccer/config/icons/app_icons_icons.dart';
import 'package:football_not_soccer/constants/strings.dart';
import 'package:football_not_soccer/core/explore/explore_screen.dart';
import 'package:football_not_soccer/core/home/home_screen.dart';
import 'package:football_not_soccer/core/leagues/competitions/competitions_screen.dart';
import 'package:football_not_soccer/core/profile/profile_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    ExploreScreen(),
    CompetitionsScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(AppIcons.home),
            title: Text(AppStrings.HOME),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(AppIcons.discovery),
            title: Text(AppStrings.EXPLORE),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(AppIcons.chart),
            title: Text(AppStrings.STANDINGS),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(AppIcons.profile),
            title: Text(AppStrings.PROFILE),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
