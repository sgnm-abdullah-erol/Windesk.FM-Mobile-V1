import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

@immutable
class AppLocalization {
  const AppLocalization._();

  static String get localizationJsonPath => 'assets/localization';
  static List<Locale> get supportedLocales => [
        const Locale('tr', 'TR'),
        const Locale('en', 'US'),
      ];

  static void init() async => await EasyLocalization.ensureInitialized();
}
