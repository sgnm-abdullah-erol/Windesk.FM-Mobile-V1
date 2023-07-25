// ignore_for_file: unused_element

import 'package:flutter/material.dart';

class WoCreateProvider extends ChangeNotifier {
  //final AuthServiceRepositoryImpl _authServiceRepository = Injection.getIt.get<AuthServiceRepositoryImpl>();

  String _summary = '';
  String get summary => _summary;

  String _requestedBy = '';
  String get requestedBy => _requestedBy;

  String _type = '';
  String get type => _type;

  String _location = '';
  String get location => _location;

  String _requestType = '';
  String get requestType => _requestType;

  void setSummary(String newValue) {
    _summary = newValue;
  }

  void setRequestedBy(String newValue) {
    _requestedBy = newValue;
  }

  void setType(String newValue) {
    _type = newValue;
  }

  void setLocation(String newValue) {
    _location = newValue;
    notifyListeners();
  }

  void setrequestType(String newValue) {
    _requestType = newValue;
    notifyListeners();
  }
}
