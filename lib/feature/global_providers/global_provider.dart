import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier {
  bool _requiredUpdate = false;
  bool get requiredUpdate => _requiredUpdate;

  String? _deviceModel;
  String get deviceModel => _deviceModel ?? '';

  String? _deviceVersion;
  String get deviceVersion => _deviceVersion ?? '';

  String? _globalUserToken;
  String get globalUserToken => _globalUserToken ?? '';

  String? _userName;
  String get userName => _userName ?? '';

  String? _userId;
  String get userId => _userId ?? '';

  void setRequiredUpdate(bool updateVar) {
    _requiredUpdate = updateVar;
    notifyListeners();
  }

  void setUserId(String userId) {
    _userId = userId;
  }

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
