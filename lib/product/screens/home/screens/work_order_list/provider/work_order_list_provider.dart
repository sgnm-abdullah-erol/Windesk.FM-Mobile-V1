import 'package:flutter/material.dart';

import '../../../../../../core/database/shared_manager.dart';
import '../../../../../../core/enums/shared_enums.dart';
import '../../../../../../feature/injection.dart';
import '../../../../../../feature/models/work_space/work_space_appendings.dart';
import '../../../../../../feature/models/work_space/work_space_detail.dart';
import '../../../../../../feature/models/work_space/work_space_my_group_demand_list.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

class WorkOrderListProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isMyWorkOrdersDataFetched = false;
  bool get isMyWorkOrdersDataFetched => _isMyWorkOrdersDataFetched;

  void setIsMyWorkOrdersDataFetched(bool result) {
    _isMyWorkOrdersDataFetched = result;
  }

  bool _isMyGroupWorkOrdersDataFetched = false;
  bool get isMyGroupWorkOrdersDataFetched => _isMyGroupWorkOrdersDataFetched;

  List<WorkSpaceDetail> _myWorkSpaceDetails = [];
  List<WorkSpaceDetail> get myWorkSpaceDetails => _myWorkSpaceDetails;

  List<WorkSpaceDetail> _myGroupWorkSpaceDetails = [];
  List<WorkSpaceDetail> get myGroupWorkSpaceDetails => _myGroupWorkSpaceDetails;

  WorkSpaceMyGroupDemandList? _workSpaceMyGroupDemandList;
  WorkSpaceMyGroupDemandList? get workSpaceMyGroupDemandList => _workSpaceMyGroupDemandList;

  List<WorkSpacePendiks> _myPendikWorkSpaceDetails = [];
  List<WorkSpacePendiks> get myPendikWorkSpaceDetails => _myPendikWorkSpaceDetails;

  final List<String> _pendinkNextStates = [];
  List<String> get pendinkNextStates => _pendinkNextStates;

  void getMyWorkOrders(String localization) async {
    if (_isMyWorkOrdersDataFetched) return;
    String userToken = await SharedManager().getString(SharedEnum.userToken);

    _isLoading = true;
    notifyListeners();
    final result = await workSpaceService.getMyWorkSpaces('swagger', userToken, 1, localization);

    result.fold((l) {
      _myWorkSpaceDetails = l;
    }, (r) {});

    _isMyWorkOrdersDataFetched = true;
    _isLoading = false;
    notifyListeners();
  }

  void getMyGroupWorkOrdersSecond(String language) async {
    if (_isMyGroupWorkOrdersDataFetched) return;
    _isLoading = true;
    notifyListeners();
    final String token = await SharedManager().getString(SharedEnum.userToken);
    if (token.isNotEmpty) {
      final result = await workSpaceService.getGroupWorkOrders(token, language);

      result.fold((l) {
        _myGroupWorkSpaceDetails = l;
      }, (r) {});

      _isMyGroupWorkOrdersDataFetched = true;
    }
    _isLoading = false;

    notifyListeners();
  }

  void getMyGroupWorkOrders(String language) async {
    if (_isMyGroupWorkOrdersDataFetched) return;
    _isLoading = true;
    notifyListeners();
    final String token = await SharedManager().getString(SharedEnum.userToken);
    if (token.isNotEmpty) {
      final result = await workSpaceService.getMyGroupDemandList(token, language);

      result.fold((l) {
        _workSpaceMyGroupDemandList = l;
      }, (r) {});

      _isMyGroupWorkOrdersDataFetched = true;
    }
    _isLoading = false;

    notifyListeners();
  }

  void getMyPendikWorkOrders(String language) async {
    _isLoading = true;
    notifyListeners();

    final String token = await SharedManager().getString(SharedEnum.userToken);
    if (token.isNotEmpty) {
      final result = await workSpaceService.getWorkSpacePendiks('swagger', token, 1, language);

      result.fold((l) {
        _myPendikWorkSpaceDetails = l;
      }, (r) {});
    }

    _isLoading = false;
    notifyListeners();
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
