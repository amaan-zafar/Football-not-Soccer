import 'package:flutter/material.dart';
import 'package:football_not_soccer/config/icons/app_icons_icons.dart';
import 'package:football_not_soccer/constants/strings.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.APP_LABEL),
      ),
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
