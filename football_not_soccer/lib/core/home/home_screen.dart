import 'package:flutter/material.dart';
import 'package:football_not_soccer/constants/strings.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(AppStrings.HOME),
      ),
    );
  }
}
