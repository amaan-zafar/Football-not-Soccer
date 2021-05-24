import 'package:flutter/material.dart';
import 'package:football_not_soccer/constants/colors.dart';

class DarkTheme {
  static ThemeData get darkTheme {
    return ThemeData(
        // Common Theme
        appBarTheme: AppBarTheme(
            backgroundColor: AppColors.black2, elevation: 0, centerTitle: true),
        //Specific
        primaryColor: AppColors.black1,
        scaffoldBackgroundColor: AppColors.black2,
        fontFamily: 'Montserrat',
        textTheme: ThemeData.dark().textTheme,
        iconTheme: IconThemeData(color: AppColors.grey2)
        // buttonTheme: ButtonThemeData(
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        //   buttonColor: CustomColors.lightPurple,
        // )
        );
  }
}
