// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/exceptions/custom_service_exceptions.dart';
import 'package:vm_fm_4/product/screens/home/service/home_service_repo_impl.dart';

import '../../../../feature/models/home_page_models/announcement_model.dart';

class HomeProvider extends ChangeNotifier {
  bool _isUserLogout = false;
  bool get isUserLogout => _isUserLogout;

  List<AnnouncementModel> _announcementList = [];
  List<AnnouncementModel> get announcementList => _announcementList;
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

  void logOut() async {
    // await SharedManager().clearAll();
    // context.read<HomeProvider>().logoutFunction();
    // if (context.read<HomeProvider>().isUserLogout == true) {
    //   snackBar(context, 'Çıkış İşlemi Başarılı', 'success');
    // } else {
    //   // await SharedManager().clearAll();
    //   // snackBar(context, 'Çıkış İşlemi Başarısız', 'error');
    //   // ignore: use_build_context_synchronously
    //   context.router.pop<bool>(true);
    // }
  }
}
