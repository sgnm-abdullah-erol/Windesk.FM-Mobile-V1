// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import '../../../../core/database/shared_manager.dart';
import '../../../../core/enums/shared_enums.dart';
import '../../../../feature/components/snackBar/snackbar.dart';
import '../../../../feature/injection.dart';
import '../../../../feature/models/auth_models/login_model.dart';
import '../../../../feature/service/global_services.dart/auth_service/auth_service_repository_impl.dart';

class LoginProvider extends ChangeNotifier {
  final AuthServiceRepositoryImpl _authService = Injection.getIt.get<AuthServiceRepositoryImpl>();

  bool _initState = true;

  bool _loading = false;

  bool get loading => _loading;

  String _userName = '';
  String get userName => _userName;

  final TextEditingController _userNameController = TextEditingController();
  TextEditingController get userNameController => _userNameController;

  String _password = '';
  String get password => _password;

  bool _isLoginSuccess = false;
  bool get isLoginSuccess => _isLoginSuccess;

  bool _isErrorActive = false;
  bool get isErrorActive => _isErrorActive;

  bool _textFieldEmptyError = false;
  bool get textFieldEmptyError => _textFieldEmptyError;

  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;

  String _userToken = '';
  String get userToken => _userToken;

  String _userTokenName = '';

  String _userId = '';
  String get userId => _userId;

  void init(String userName) {
    if (_initState) {
      setUserName(userName);
      _userNameController.text = userName;
      _initState = false;
      notifyListeners();
    }
  }

  void setRememberMe(bool value) {
    _rememberMe = value;
  }

  void getRememberInfo() async {
    _userNameController.text = await SharedManager().getString(SharedEnum.userNameLogin);
    _userName = _userNameController.text;
    notifyListeners();
  }

  void logIn(BuildContext context) async {
    if (_userName.isNotEmpty && _password.isNotEmpty) {
      _loading = true;
      notifyListeners();

      final response = await _authService.login(userNameController.text, password);

      // ignore: unused_local_variable
      LoginModel loginModel;

      response.fold((login) {
        _isLoginSuccess = true;
        _userId = login.id.toString();
        notifyListeners();
        _userToken = login.accessToken ?? '';

        Future.delayed(const Duration(milliseconds: 2000), () async {
          loginModel = login;
          _userTokenName = userName;

          // set userName
          setUserName(_userName);

          //  save the token to preferences
          await _setTokenToPreferences(login.refreshToken ?? '', login.id.toString(), context, login.accessToken ?? '');
        });

        Future.delayed(const Duration(milliseconds: 1000), () {
          _loading = false;
          _isLoginSuccess = false;
        });
      }, (error) {
        _isLoginSuccess = false;
        _isErrorActive = true;
        _loading = false;
        setUserName(_userName);
        notifyListeners();
        Future.delayed(const Duration(milliseconds: 1000), () {
          _isErrorActive = false;
        });
      });
    } else {
      _textFieldEmptyError = true;
      setUserName(_userName);

      notifyListeners();
      Future.delayed(const Duration(milliseconds: 1000), () {
        _textFieldEmptyError = false;
      });
    }
  }

  Future<void> _setTokenToPreferences(String refreshToken, String userId, context, String accessToken) async {
    await SharedManager().setString(SharedEnum.userNameLogin, _userNameController.text);
    await SharedManager().setString(SharedEnum.userToken, _userToken);
    await SharedManager().setString(SharedEnum.userName, _userNameController.text);
    await SharedManager().setString(SharedEnum.refreshToken, refreshToken);
    await SharedManager().setString(SharedEnum.userId, userId);
    await SharedManager().setBool(SharedEnum.rememberMe, _rememberMe);
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

  void setStart() {
    _password = '';
    _userName = '';
    _isLoginSuccess = false;
    _textFieldEmptyError = false;
    _isErrorActive = false;
    _userToken = '';
    _userTokenName = '';
    notifyListeners();
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
