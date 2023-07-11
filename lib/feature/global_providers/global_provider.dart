import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier {
  String? _deviceModel;
  String get deviceModel => _deviceModel ?? '';

  String? _deviceVersion;
  String get deviceVersion => _deviceVersion ?? '';

  // set functions
  void setDeviceModel(String deviceModel) {
    _deviceModel = deviceModel;
  }

  void setDeviceVersion(String deviceVersion) {
    _deviceVersion = deviceVersion;
  }
}
