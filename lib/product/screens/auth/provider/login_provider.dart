// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import '../../../../core/database/shared_manager.dart';
import '../../../../core/enums/shared_enums.dart';
import '../../../../feature/components/snackBar/snackbar.dart';
import '../../../../feature/injection.dart';
import '../../../../feature/models/auth_models/login_model.dart';
import '../../../../feature/service/global_services.dart/auth_service/auth_service_repository_impl.dart';

class LoginProvider extends ChangeNotifier {
  final AuthServiceRepositoryImpl _authService =
      Injection.getIt.get<AuthServiceRepositoryImpl>();

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
  String _userTokenName = '';

  String _userId = '';
  String get userId => _userId;

  void setRememberMe(bool value) {
    _rememberMe = value;
  }

  void getRememberInfo() async {
    _userNameController.text =
        await SharedManager().getString(SharedEnum.userNameLogin);
    _userName = _userNameController.text;
    notifyListeners();
  }

  void logIn(BuildContext context) async {
    if (_userName.isNotEmpty && _password.isNotEmpty) {
      _loading = true;
      notifyListeners();

      final response =
          await _authService.login(userNameController.text, password);

      LoginModel loginModel;

      response.fold((login) {
        // _setUserName(context);
        _isLoginSuccess = true;
        _userId = login.id.toString();
        notifyListeners();

        Future.delayed(const Duration(milliseconds: 2000), () async {
          loginModel = login;
          _userToken =
              'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICIyQ2Eyb2NaMDRtb3QtaDdpSkh6eDhIdTNUV1NPZ21UcHdFTlBaOFFraExvIn0.eyJleHAiOjE3MDAxMzgwMDQsImlhdCI6MTY5OTI3NDAwNCwianRpIjoiNzRiOWU1YTctYjkwZi00NzcyLWFhZjgtZGI1MTVhMmRkNzM4IiwiaXNzIjoiaHR0cDovLzEzOC4yMDEuMTg2LjE5MDozMDA1My9hdXRoL3JlYWxtcy9JRk0iLCJhdWQiOlsicmVhbG0tbWFuYWdlbWVudCIsImFjY291bnQiXSwic3ViIjoiYWIzNzdkYzktY2NiYS00YzQ5LTllN2MtMTM2ZmM2Y2M3NzI3IiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiaWZtX2ZhY2lsaXR5X2NsaWVudCIsInNlc3Npb25fc3RhdGUiOiI1NjU4ZDUyZi05MGFkLTQyNTEtOTYzYy1kNWY0NWUyN2Y2MjAiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbIioiXSwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbImFkbWluX3JvbGUiLCJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIiwiZGVmYXVsdC1yb2xlcy1pZm0iXX0sInJlc291cmNlX2FjY2VzcyI6eyJyZWFsbS1tYW5hZ2VtZW50Ijp7InJvbGVzIjpbInZpZXctaWRlbnRpdHktcHJvdmlkZXJzIiwidmlldy1yZWFsbSIsIm1hbmFnZS1pZGVudGl0eS1wcm92aWRlcnMiLCJpbXBlcnNvbmF0aW9uIiwicmVhbG0tYWRtaW4iLCJjcmVhdGUtY2xpZW50IiwibWFuYWdlLXVzZXJzIiwicXVlcnktcmVhbG1zIiwidmlldy1hdXRob3JpemF0aW9uIiwicXVlcnktY2xpZW50cyIsInF1ZXJ5LXVzZXJzIiwibWFuYWdlLWV2ZW50cyIsIm1hbmFnZS1yZWFsbSIsInZpZXctZXZlbnRzIiwidmlldy11c2VycyIsInZpZXctY2xpZW50cyIsIm1hbmFnZS1hdXRob3JpemF0aW9uIiwibWFuYWdlLWNsaWVudHMiLCJxdWVyeS1ncm91cHMiXX0sImlmbV9mYWNpbGl0eV9jbGllbnQiOnsicm9sZXMiOlsidXNlcl9kZWxldGUiLCJzeXN0ZW1fY3JlYXRlIiwiam9pbnRzcGFjZV91cGRhdGUiLCJ0YXNrX2RlbGV0ZSIsInRhc2tfdXBkYXRlIiwidXNlcl91cGRhdGUiLCJqb2ludHNwYWNlX3ZpZXciLCJ2aWV3X3NhcCIsInpvbmVfY3JlYXRlIiwiY29udGFjdF91cGRhdGUiLCJjb21wb25lbnRfdmlldyIsInpvbmVfZXhwb3J0Iiwic3lzdGVtX2V4cG9ydCIsImdyb3VwX3ZpZXciLCJ3b3Jrc3BhY2VfbWFuYWdlciIsImpvaW50c3BhY2VfZGVsZXRlIiwiY29udGFjdF9kZWxldGUiLCJ3b3Jrc3BhY2VfdmlldyIsInpvbmVfdmlldyIsIndvcmtmbG93X2RlbGV0ZSIsImdyb3VwX2RlbGV0ZSIsInVzZXJfdmlldyIsInR5cGVfZGVsZXRlIiwiY29tcG9uZW50X2NyZWF0ZSIsImZhY2lsaXR5X2NsaWVudF9yb2xlX2FkbWluIiwic3RydWN0dXJlX3VwZGF0ZSIsInNhcF9wb3N0IiwiY29tcG9uZW50X2V4cG9ydCIsIndvcmtzcGFjZV9jcmVhdGUiLCJjbGFzc2lmaWNhdGlvbl9kZWxldGUiLCJzeXN0ZW1fdmlldyIsInN5c3RlbV9kZWxldGUiLCJzdHJ1Y3R1cmVfdmlldyIsIndvcmtmbG93X3ZpZXciLCJjb21wb25lbnRfdXBkYXRlIiwid29ya3NwYWNlX2FkbWluIiwiY3JlYXRlX3NhcCIsInpvbmVfdXBkYXRlIiwiam9pbnRzcGFjZV9leHBvcnQiLCJmYWNpbGl0eV9jbGllbnRfcm9sZV91c2VyIiwicm9sZV92aWV3IiwiY29udGFjdF9jcmVhdGUiLCJjb250YWN0X3ZpZXciLCJ3b3Jrc3BhY2VfdXNlcl9hZG1pbiIsImpvaW50c3BhY2VfY3JlYXRlIiwidGFza19jcmVhdGUiLCJzdHJ1Y3R1cmVfZGVsZXRlIiwiY2xhc3NpZmljYXRpb25fdmlldyIsInR5cGVfY3JlYXRlIiwidGFza192aWV3Iiwid29ya3NwYWNlX3VwZGF0ZSIsIndvcmtzcGFjZV9kZWxldGUiLCJjb250YWN0X2V4Y2VsX2V4cG9ydCIsInR5cGVfdXBkYXRlIiwieXlzX2NyZWF0ZSIsImNsYXNzaWZpY2F0aW9uX3VwZGF0ZSIsInN0cnVjdHVyZV9leHBvcnQiLCJ1bWFfcHJvdGVjdGlvbiIsImdyb3VwX3VwZGF0ZSIsInN0cnVjdHVyZV9jcmVhdGUiLCJ3b3JrZmxvd191cGRhdGUiLCJhbGxfYWNpbGl0eV9hc3NldF9yb2xlcyIsInR5cGVfZXhwb3J0IiwidXNlcl9jcmVhdGUiLCJ6b25lX2RlbGV0ZSIsImNvbXBvbmVudF9kZWxldGUiLCJncm91cF9jcmVhdGUiLCJ3b3JrZmxvd19jcmVhdGUiLCJzdHJ1Y3R1cmUtYXNzZXQtdmlldyIsImRlbGV0ZV9zYXAiLCJ5eXNfdmlldyIsImNsYXNzaWZpY2F0aW9uX2NyZWF0ZSIsInR5cGVfdmlldyIsInN5c3RlbV91cGRhdGUiXX0sImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJ2aWV3LWFwcGxpY2F0aW9ucyIsInZpZXctY29uc2VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwiZGVsZXRlLWFjY291bnQiLCJtYW5hZ2UtY29uc2VudCIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoiZW1haWwgcHJvZmlsZSIsInNpZCI6IjU2NThkNTJmLTkwYWQtNDI1MS05NjNjLWQ1ZjQ1ZTI3ZjYyMCIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwibmFtZSI6IkpvaG4gRG9lMiIsInByZWZlcnJlZF91c2VybmFtZSI6InVzZXIxIiwiZ2l2ZW5fbmFtZSI6IkpvaG4iLCJmYW1pbHlfbmFtZSI6IkRvZTIiLCJlbWFpbCI6InVzZXIxQHVzZXIxLmNvbSJ9.LkG4681_Am_1glZC4s7H37rSslhe8k0NBqs_1UXFy7VR_PyhaOGOA1U9c41QbttwXFgvhld3qFmy6ue9lo89X7lEWFPyVP44gWjXy5CftQ7ppgZ3UHU3ysRX03bh3LfuEhz1UqEDj-pIRcG1QRNL0VVwUeto0oBpP6GR2sEu4PiJJ0_J_fEDIF--FnTfVsG97qdfGOUVQNV6Dj7XK-i1jkpDJV-n8t_eecv42vXBQsQnsx-33x5rbXBSnC1bgfp_ZQqwSGE7MSC55C9DLpkh9ZgP1RVnoHqIla_0HnmlJvU7PS2BlNyE9cVzOoxSmLfRCoqZnX6kwVauBs2n8K26aA';
          _userTokenName = userName;

          //  save the token to preferences
          await _setTokenToPreferences(
              login.refreshToken ?? '', login.id.toString());

          _setField();
        });

        Future.delayed(const Duration(milliseconds: 1000), () {
          notifyListeners();
          _loading = false;
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

  Future<void> _setTokenToPreferences(
      String refreshToken, String userId) async {
    await SharedManager()
        .setString(SharedEnum.userNameLogin, _userNameController.text);
    await SharedManager().setString(SharedEnum.userToken, _userToken);
    await SharedManager()
        .setString(SharedEnum.userName, _userNameController.text);
    await SharedManager().setString(SharedEnum.refreshToken, refreshToken);
    await SharedManager().setString(SharedEnum.userId, userId);
    await SharedManager().setBool(SharedEnum.rememberMe, _rememberMe);
  }

  // void _setUserName(BuildContext context) async {
  //   Provider.of<GlobalProvider>(context, listen: false).setUserName(_userTokenName);
  // }

  void _setField() {
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
