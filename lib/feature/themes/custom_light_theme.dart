import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/other/colors.dart';

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
      textTheme: const TextTheme(),
    );
  }
}
