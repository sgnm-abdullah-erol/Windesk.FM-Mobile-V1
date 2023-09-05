import 'package:flutter/material.dart';

@immutable
class CustomDarkTheme {
  late final ThemeData darkTheme;

  CustomDarkTheme() {
    darkTheme = ThemeData.light().copyWith();
  }
}
