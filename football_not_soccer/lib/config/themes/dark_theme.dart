import 'package:flutter/material.dart';
import 'package:football_not_soccer/constants/colors.dart';

class DarkTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.black1,
      scaffoldBackgroundColor: AppColors.black2,
      fontFamily: 'Montserrat',
      // textTheme: ThemeData.dark().textTheme,
      // buttonTheme: ButtonThemeData(
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      //   buttonColor: CustomColors.lightPurple,
      // )
    );
  }
}
