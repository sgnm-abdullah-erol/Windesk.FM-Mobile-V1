import 'package:flutter/material.dart';
import 'package:vm_fm_4/core/database/shared_manager.dart';
import 'package:vm_fm_4/core/enums/shared_enums.dart';

class ThemeProvider extends ChangeNotifier {
  final SharedManager _preferences = SharedManager();
  bool _isDark = false;
  bool get isDark => _isDark;

  ThemeProvider() {
    _initPreferences();
  }

  void _initPreferences() async {
    await _preferences.initInstances();
    getPreferences();
  }

  getPreferences() async {
    _isDark = await _preferences.getBool(SharedEnum.theme);
    notifyListeners();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setBool(SharedEnum.theme, value);
    notifyListeners();
  }
}
