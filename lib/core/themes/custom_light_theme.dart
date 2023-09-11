import 'package:flutter/material.dart';

import '../constants/other/colors.dart';
import '../constants/style/font_sizes.dart';

@immutable
class CustomLightTheme {
  late final ThemeData lightTheme;

  CustomLightTheme() {
    lightTheme = ThemeData.light().copyWith(
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
        // titles
        titleLarge: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.titleLarge,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        titleMedium: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.titleLarge - 4,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        titleSmall: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.title,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),

        // display texts
        displayLarge: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.title,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        displayMedium: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.title - 3,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        displaySmall: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.title - 8,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),

        // body texts
        bodyLarge: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.body + 4,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        bodyMedium: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.body + 2,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
          letterSpacing: 0.75,
        ),
        bodySmall: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.body,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),

        // label texts
        labelLarge: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.body + 1,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        labelMedium: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.body - 2,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
          letterSpacing: 0.5,
        ),
        labelSmall: TextStyle(
          color: APPColors.Main.black,
          fontSize: FontSizes.body - 4,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
