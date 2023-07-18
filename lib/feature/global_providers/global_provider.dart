import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier {
  String? _deviceModel;
  String get deviceModel => _deviceModel ?? '';

  String? _deviceVersion;
  String get deviceVersion => _deviceVersion ?? '';

  String? _globalUserToken;
  String get globalUserToken => _globalUserToken ?? '';

  String? _userName;
  String get userName => _userName ?? '';

  // set functions
  void setDeviceModel(String deviceModel) {
    _deviceModel = deviceModel;
  }

  void setDeviceVersion(String deviceVersion) {
    _deviceVersion = deviceVersion;
  }

  void setGlobalUserToken(String globalUserToken) {
    _globalUserToken = globalUserToken;
  }

  void setUserName(String userName) {
    _userName = userName;
  }
}
