import 'package:flutter/material.dart';
import '../constants/other/colors.dart';
import '../constants/style/font_sizes.dart';

@immutable
class CustomDarkTheme {
  late final ThemeData darkTheme;

  CustomDarkTheme() {
    darkTheme = ThemeData.dark().copyWith(
      textTheme: TextTheme(
        // titles
        titleLarge: TextStyle(
          color: APPColors.Main.white,
          fontSize: FontSizes.titleLarge,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        titleMedium: TextStyle(
          color: APPColors.Main.white,
          fontSize: FontSizes.titleLarge - 4,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        titleSmall: TextStyle(
          color: APPColors.Main.white,
          fontSize: FontSizes.title,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),

        // display texts
        displayLarge: TextStyle(
          color: APPColors.Main.white,
          fontSize: FontSizes.title,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        displayMedium: TextStyle(
          color: APPColors.Main.white,
          fontSize: FontSizes.title - 3,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        displaySmall: TextStyle(
          color: APPColors.Main.white,
          fontSize: FontSizes.title - 8,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),

        // body texts
        bodyLarge: TextStyle(
          color: APPColors.Main.white,
          fontSize: FontSizes.body + 4,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        bodyMedium: TextStyle(
          color: APPColors.Main.white,
          fontSize: FontSizes.body + 2,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
          letterSpacing: 0.75,
        ),
        bodySmall: TextStyle(
          color: APPColors.Main.white,
          fontSize: FontSizes.body,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),

        // label texts
        labelLarge: TextStyle(
          color: APPColors.Main.white,
          fontSize: FontSizes.body + 1,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        labelMedium: TextStyle(
          color: APPColors.Main.white,
          fontSize: FontSizes.body - 2,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
          letterSpacing: 0.5,
        ),
        labelSmall: TextStyle(
          color: APPColors.Main.white,
          fontSize: FontSizes.body - 4,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
