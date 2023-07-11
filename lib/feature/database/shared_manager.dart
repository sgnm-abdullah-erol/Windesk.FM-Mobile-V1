import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class SharedManager {
  static SharedPreferences? _sharedPreferences;

  SharedManager() {
    if (_sharedPreferences == null) initInstances();
  }

  Future<void> initInstances() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await _sharedPreferences!.setString(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    await _sharedPreferences!.setBool(key, value);
  }

  Future<String> getString(String key) async {
    return _sharedPreferences!.getString(key) ?? '';
  }

  Future<bool> getBool(String key) async {
    return _sharedPreferences!.getBool(key) ?? false;
  }
}
