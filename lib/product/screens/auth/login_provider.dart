import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  String _userName = '';
  String get userName => _userName;

  String _password = '';
  String get password => _password;

  bool _showPassword = false;
  bool get showPassword => _showPassword;

  void logIn() {
    if (_userName.isNotEmpty && _password.isNotEmpty) {
      _loading = true;
      notifyListeners();
      Future.delayed(const Duration(seconds: 2), () {
        _loading = false;

        notifyListeners();
      });
    }
  }

  // set functions
  void setUserName(String value) {
    _userName = value;
  }

  void setPassword(String value) {
    _password = value;
  }

  void setShowPassword() {
    _showPassword = !showPassword;
    notifyListeners();
  }
}
