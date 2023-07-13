import 'package:flutter/material.dart';
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

  bool _showPassword = false;
  bool get showPassword => _showPassword;

  bool _isLoginSuccess = false;
  bool get isLoginSuccess => _isLoginSuccess;

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
        _setField();
        notifyListeners();
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

  void setShowPassword() {
    _showPassword = !showPassword;
    notifyListeners();
  }
}
