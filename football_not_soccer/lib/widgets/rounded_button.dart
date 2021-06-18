import 'package:flutter/material.dart';
import 'package:football_not_soccer/constants/colors.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String textOnButton;

  RoundButton({required this.textOnButton, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: AppColors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        child: Text(textOnButton, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
