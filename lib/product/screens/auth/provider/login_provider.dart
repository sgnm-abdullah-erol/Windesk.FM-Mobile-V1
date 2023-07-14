import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/feature/database/shared_manager.dart';
import 'package:vm_fm_4/feature/enums/shared_enums.dart';
import 'package:vm_fm_4/feature/models/auth_models/login_model.dart';
import 'package:vm_fm_4/feature/service/global_services.dart/auth_service/auth_service_repository.dart';
import 'package:vm_fm_4/feature/service/global_services.dart/auth_service/auth_service_repository_impl.dart';

class LoginProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  String _userName = '';
  String get userName => _userName;

  String _password = '';
  String get password => _password;

  bool _isLoginSuccess = false;
  bool get isLoginSuccess => _isLoginSuccess;

  bool _isErrorActive = false;
  bool get isErrorActive => _isErrorActive;

  bool _textFieldEmptyError = false;
  bool get textFieldEmptyError => _textFieldEmptyError;

  String _userToken = '';
  String _userTokenName = '';

  void logIn(BuildContext context) async {
    if (_userName.isNotEmpty && _password.isNotEmpty) {
      AuthServiceRepository authService = AuthServiceRepositoryImpl();
      _loading = true;
      notifyListeners();

      final response = await authService.login(userName, password);

      LoginModel loginModel;

      response.fold((login) {
        _isLoginSuccess = true;
        notifyListeners();
        loginModel = login;
        _userToken = loginModel.accessToken ?? '';
        _userTokenName = userName;
        _setTokenToPreferences();
        _setField();
        Future.delayed(const Duration(milliseconds: 500), () {
          _isLoginSuccess = false;
        });
      }, (error) {
        _isLoginSuccess = false;
        _isErrorActive = true;
        _loading = false;
        notifyListeners();
        Future.delayed(const Duration(milliseconds: 1000), () {
          _isErrorActive = false;
        });
      });
    } else {
      _textFieldEmptyError = true;
      notifyListeners();
      Future.delayed(const Duration(milliseconds: 1000), () {
        _textFieldEmptyError = false;
      });
    }
  }

  void _setTokenToPreferences() async {
    if (_userToken != '' && _userName != '') {
      await SharedManager().setString(SharedEnum.userToken, _userToken);
      await SharedManager().setString(SharedEnum.userName, _userTokenName);
    }
  }

  void _setField() {
    _userName = "";
    _password = "";
  }

  // set functions
  void setUserName(String value) {
    _userName = value;
  }

  void setPassword(String value) {
    _password = value;
  }

  void showSnckbar(BuildContext context, String message, String type) {
    snackBar(context, message, type);
  }
}

class LoginPassword extends ChangeNotifier {
  bool _showPassword = false;
  bool get showPassword => _showPassword;

  void setShowPassword() {
    _showPassword = !showPassword;
    notifyListeners();
  }
}
