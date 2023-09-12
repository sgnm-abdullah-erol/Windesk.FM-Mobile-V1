import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/themes/theme_provider.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => width * 0.01;
  double get normalValue => width * 0.1;
  double get mediumValue => height * 0.02;
  double get highValue => height * 0.1;

  double dynamicWidth(double val) => width * val;
  double dynamicHeight(double val) => height * val;

  // theme
  bool get theme => Provider.of<ThemeProvider>(this).isDark;

  // theme extensions
  TextStyle get defaultTextStyle => const TextStyle();
  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge ?? defaultTextStyle;
  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium ?? defaultTextStyle;
  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall ?? defaultTextStyle;
  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge ?? defaultTextStyle;
  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium ?? defaultTextStyle;
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall ?? defaultTextStyle;
  TextStyle get displayLarge => Theme.of(this).textTheme.displayLarge ?? defaultTextStyle;
  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium ?? defaultTextStyle;
  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall ?? defaultTextStyle;
  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge ?? defaultTextStyle;
  TextStyle get labelMedium => Theme.of(this).textTheme.labelMedium ?? defaultTextStyle;
  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall ?? defaultTextStyle;
}
