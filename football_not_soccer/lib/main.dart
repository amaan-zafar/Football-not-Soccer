import 'package:flutter/material.dart';
import 'package:football_not_soccer/config/themes/dark_theme.dart';
import 'package:football_not_soccer/constants/strings.dart';
import 'package:football_not_soccer/core/root/root_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:http/http.dart' as http;

void main() {
  final http.Client _client = http.Client();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.APP_LABEL,
      theme: DarkTheme.darkTheme,
      home: RootScreen(),
    );
  }
}
