import 'package:flutter/material.dart';
import 'package:football_not_soccer/config/themes/text_theme.dart';
import 'package:football_not_soccer/constants/colors.dart';

class DarkTheme {
  static ThemeData get darkTheme {
    return ThemeData(
        // Common Theme
        appBarTheme: AppBarTheme(
            backgroundColor: AppColors.black2, elevation: 0, centerTitle: true),
        fontFamily: 'Source Sans Pro',
        //Specific
        brightness: Brightness.dark,
        primaryColor: AppColors.black1,
        scaffoldBackgroundColor: AppColors.black2,
        textTheme: textTheme,
        iconTheme: IconThemeData(color: AppColors.grey2)
        // buttonTheme: ButtonThemeData(
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        //   buttonColor: CustomColors.lightPurple,
        // )
        );
  }
}
