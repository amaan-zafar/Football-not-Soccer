import 'package:flutter/material.dart';
import 'package:football_not_soccer/constants/colors.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  TextFieldContainer({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Card(
        shadowColor: AppColors.darkBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 2,
        child: Padding(padding: EdgeInsets.only(left: 14), child: child),
      ),
    );
  }
}
