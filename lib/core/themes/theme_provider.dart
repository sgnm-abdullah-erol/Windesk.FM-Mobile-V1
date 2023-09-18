import 'package:flutter/material.dart';

import '../database/shared_manager.dart';
import '../enums/shared_enums.dart';

class ThemeProvider extends ChangeNotifier {
  final SharedManager _preferences = SharedManager();
  bool _isDark = false;
  bool get isDark => _isDark;

  ThemeProvider() {
    _initPreferences();
  }

  void _initPreferences() async {
    await _preferences.initInstances();
    await getPreferences();
  }

  Future<void> getPreferences() async {
    _isDark = await _preferences.getBool(SharedEnum.theme);
    notifyListeners();
  }

  void setTheme(bool value) async {
    _isDark = value;
    _preferences.setBool(SharedEnum.theme, value);
    notifyListeners();
  }
}
