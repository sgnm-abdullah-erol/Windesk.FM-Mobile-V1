import 'package:flutter/material.dart';

import '../constants/other/colors.dart';
import '../constants/style/font_sizes.dart';

@immutable
class CustomLightTheme {
  late final ThemeData lightTheme;

  CustomLightTheme() {
    lightTheme = ThemeData.light().copyWith(
      primaryColor: APPColors.Main.black,
      secondaryHeaderColor: APPColors.Main.black,
      scaffoldBackgroundColor: APPColors.Main.white,
      appBarTheme: AppBarTheme(
        color: APPColors.Main.white,
        elevation: 0,
        iconTheme: IconThemeData(color: APPColors.Main.black),
        titleTextStyle: TextStyle(
          color: APPColors.Main.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: APPColors.Main.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        hintStyle: TextStyle(
          color: APPColors.Main.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: APPColors.Main.black,
            width: 1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: APPColors.Main.black,
            width: 1,
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: APPColors.Main.black,
            width: 1,
          ),
        ),
      ),
      textTheme: TextTheme(
        // create basic text theme
        titleMedium: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.subtitle - 2,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.caption + 1,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        bodyMedium: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.caption + 1,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
          letterSpacing: 0.5,
        ),
        bodySmall: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.overline,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        displayLarge: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.body,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        displayMedium: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.caption + 1,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        displaySmall: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.caption + 1,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
