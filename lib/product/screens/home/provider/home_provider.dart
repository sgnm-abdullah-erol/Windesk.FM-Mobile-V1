// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vm_fm_4/core/enums/shared_enums.dart';
import 'package:vm_fm_4/feature/exceptions/custom_service_exceptions.dart';
import 'package:vm_fm_4/feature/global_providers/global_provider.dart';
import 'package:vm_fm_4/feature/service/global_services.dart/auth_service/auth_service_repository_impl.dart';
import 'package:vm_fm_4/product/screens/home/service/home_service_repo_impl.dart';

import '../../../../core/database/shared_manager.dart';
import '../../../../feature/injection.dart';
import '../../../../feature/models/home_page_models/announcement_model.dart';

class HomeProvider extends ChangeNotifier {
  final AuthServiceRepositoryImpl _authServiceRepository =
      Injection.getIt.get<AuthServiceRepositoryImpl>();

  bool _isUserLogout = false;
  bool get isUserLogout => _isUserLogout;

  bool _logoutError = false;
  bool get logoutError => _logoutError;

  List<AnnouncementModel> _announcementList = [];
  List<AnnouncementModel> get announcementList => _announcementList;

  String _userName = '';
  String get userName => _userName;

  set setiannouncementList(List<AnnouncementModel> announcementList) {
    _announcementList = announcementList;
    notifyListeners();
  }

  int _totalAnnoucementCount = 0;
  int get totalAnnoucementCount => _totalAnnoucementCount;
  set settotalAnnoucementCount(int totalAnnoucementCount) {
    _totalAnnoucementCount = totalAnnoucementCount;
    notifyListeners();
  }

  void logoutFunction() async {
    final result = HomeServiceRepositoryImpl().logout();
    // ignore: unrelated_type_equality_checks
    if (result == 'success') {
      _isUserLogout = true;
      notifyListeners();
    }
  }

  void getAnnouncement() {
    final result = HomeServiceRepositoryImpl().getAnnouncements();
    if (result is CustomServiceException) {
    } else {
      announcementList.addAll(result as List<AnnouncementModel>);
    }
    settotalAnnoucementCount = announcementList.length;
    notifyListeners();
  }

  void logOut(BuildContext context) async {
    final String refreshToken =
        await SharedManager().getString(SharedEnum.refreshToken);
    final String token = await SharedManager().getString(SharedEnum.userToken);

    if (token.isNotEmpty && refreshToken.isNotEmpty) {
      final response = await _authServiceRepository.logout(refreshToken, token);
      response.fold(
        (l) => {
          _setUserNameToGlobalProvider(context),
          _isUserLogout = true,
          _clearShared(),
          notifyListeners(),
          Future.delayed(
              const Duration(seconds: 1), () => _isUserLogout = false),
        },
        (r) => {
          _isUserLogout = false,
          _logoutError = true,
          notifyListeners(),
          Future.delayed(
              const Duration(seconds: 1), () => _logoutError = false),
        },
      );
    }
  }

  void _setUserNameToGlobalProvider(BuildContext context) async {
    _userName = await SharedManager().getString(SharedEnum.userName);
    // ignore: use_build_context_synchronously
    Provider.of<GlobalProvider>(context, listen: false).setUserName(_userName);
  }

  void _clearShared() async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    // await pref.remove(SharedEnum.userNameLogin.toString());

    await SharedManager().clearAllWithoutUserName();
  }
}
