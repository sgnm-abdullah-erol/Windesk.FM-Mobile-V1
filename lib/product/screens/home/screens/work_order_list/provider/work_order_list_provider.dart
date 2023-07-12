import 'package:flutter/material.dart';

import '../../../../../../feature/injection.dart';
import '../../../../../../feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

class WorkOrderListProvider extends ChangeNotifier {
  final WorkOrderServiceRepositoryImpl service = Injection.getIt.get<WorkOrderServiceRepositoryImpl>();

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isMyWorkOrdersDataFetched = false;
  bool get isMyWorkOrdersDataFetched => _isMyWorkOrdersDataFetched;

  bool _isMyGroupWorkOrdersDataFetched = false;
  bool get isMyGroupWorkOrdersDataFetched => _isMyGroupWorkOrdersDataFetched;

  bool _isMyPendikWorkOrdersDataFetched = false;
  bool get isMyPendikWorkOrdersDataFetched => _isMyPendikWorkOrdersDataFetched;

  void getMyWorkOrders() {
    if (_isMyWorkOrdersDataFetched) return;

    _isLoading = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _isMyWorkOrdersDataFetched = true;
      _isLoading = false;
      notifyListeners();
    });
  }

  void getMyGroupWorkOrders() {
    if (_isMyGroupWorkOrdersDataFetched) return;

    _isLoading = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _isMyGroupWorkOrdersDataFetched = true;
      _isLoading = false;
      notifyListeners();
    });
  }

  void getMyPendikWorkOrders() {
    if (_isMyPendikWorkOrdersDataFetched) return;

    _isLoading = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _isMyPendikWorkOrdersDataFetched = true;
      _isLoading = false;
      notifyListeners();
    });
  }

  void changeTab(int index) {
    switch (index) {
      case 0:
        _tabIndex = 0;
        break;
      case 1:
        _tabIndex = 1;
        break;
      case 2:
        _tabIndex = 2;
        break;
    }
    notifyListeners();
  }
}
