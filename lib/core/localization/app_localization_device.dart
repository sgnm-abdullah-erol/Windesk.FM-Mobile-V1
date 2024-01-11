import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@immutable
final class AppLocalization {
  const AppLocalization._();

  static String get localizationJsonPath => '/data/user/0/com.example.vm_fm_4/app_flutter/';
  static List<Locale> get supportedLocales => [
        const Locale('tr', 'TR'),
        const Locale('en', 'US'),
      ];

  static Future<void> init() async => await EasyLocalization.ensureInitialized();
}
