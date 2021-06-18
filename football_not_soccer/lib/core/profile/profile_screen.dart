import 'package:flutter/material.dart';
import 'package:football_not_soccer/constants/strings.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: [
            Text(AppStrings.PROFILE),
          ],
        ),
      ),
    );
  }
}
