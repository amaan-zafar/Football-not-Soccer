import 'package:flutter/material.dart';
import 'package:football_not_soccer/constants/colors.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  CustomCard({required this.child});
  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.black1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 6.0,
        margin: EdgeInsets.symmetric(horizontal: 28),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 48),
          child: child,
        ));
  }
}
