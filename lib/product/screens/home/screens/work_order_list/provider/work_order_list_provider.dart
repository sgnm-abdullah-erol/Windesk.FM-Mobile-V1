import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/enums/shared_enums.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_detail.dart';
import 'package:vm_fm_4/feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

import '../../../../../../feature/database/shared_manager.dart';
import '../../../../../../feature/injection.dart';
import '../../../../../../feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

class WorkOrderListProvider extends ChangeNotifier {
  final WorkOrderServiceRepositoryImpl service = Injection.getIt.get<WorkOrderServiceRepositoryImpl>();
  final WorkSpaceServiceRepositoryImpl workSpaceService = WorkSpaceServiceRepositoryImpl();

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

  List<WorkSpaceDetail> _myWorkSpaceDetails = [];
  List<WorkSpaceDetail> get myWorkSpaceDetails => _myWorkSpaceDetails;

  List<WorkSpaceDetail> _myGroupWorkSpaceDetails = [];
  List<WorkSpaceDetail> get myGroupWorkSpaceDetails => _myGroupWorkSpaceDetails;

  List<WorkSpaceDetail> _myPendikWorkSpaceDetails = [];
  List<WorkSpaceDetail> get myPendikWorkSpaceDetails => _myPendikWorkSpaceDetails;

  void getMyWorkOrders() async {
    if (_isMyWorkOrdersDataFetched) return;
    String userToken = await SharedManager().getString(SharedEnum.userToken);

    _isLoading = true;
    notifyListeners();
    final result = await workSpaceService.getMyWorkSpaces('swagger', userToken, 1);

    result.fold((l) {
      _myWorkSpaceDetails = l;
    }, (r) {});

    _isMyWorkOrdersDataFetched = true;
    _isLoading = false;
    notifyListeners();
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
