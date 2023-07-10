import 'package:flutter/material.dart';

@immutable
class CustomBorderRadius {
  const CustomBorderRadius._();
  static BorderRadius mediumBorderRadius = BorderRadius.circular(15);
  static BorderRadius largeBorderRadius = BorderRadius.circular(30);
  static BorderRadius circularBorderRadius = BorderRadius.circular(100);

  static Radius buttonMediumRadius = const Radius.circular(15);
}
