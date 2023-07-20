import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_efforts.dart';

import '../../../../../../feature/database/shared_manager.dart';
import '../../../../../../feature/enums/shared_enums.dart';
import '../../../../../../feature/models/work_space/work_space_detail.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

class WorkOrderDetailProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = WorkSpaceServiceRepositoryImpl();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  WorkSpaceDetail? _woDetailList;
  WorkSpaceDetail? get woDetailList => _woDetailList;

  void getWorkOrderWithSearch(String workOrderCode) async {
    String userToken = await SharedManager().getString(SharedEnum.userToken);

    _isLoading = true;
    notifyListeners();
    final result = await workSpaceService.getWorkOrderWithSearch(workOrderCode, userToken);

    result.fold((l) => {_woDetailList = l, _isSuccess = true}, (r) {});
    notifyListeners();

    _isLoading = false;
    notifyListeners();
  }

  ////// YUKARI SEARCH KISMINA TASINSIN
  ///
  ///

  WorkSpaceEfforts? _woEffortList;
  WorkSpaceEfforts? get woEffortList => _woEffortList;

  bool _isWorkOrderEffortListFetched = false;
  bool get isWorkOrderEffortListFetched => _isWorkOrderEffortListFetched;

  void getEfforts(String taskId, String nextStateId) async {
    String userToken = await SharedManager().getString(SharedEnum.userToken);

    _isLoading = true;
    _isWorkOrderEffortListFetched = true;
    notifyListeners();
    final result = await workSpaceService.getWorkOrderEfforts(taskId, nextStateId, userToken);

    result.fold(
      (l) => {
        _woEffortList = l,
        notifyListeners(),
      },
      (r) {},
    );
    _isLoading = false;
    notifyListeners();
  }
}

class WorkOrderDetailServiceProvider extends ChangeNotifier {
  bool _isEffortListFetched = false;
  bool get isEffortListFetched => _isEffortListFetched;

  bool _isMaterialPartsFetched = false;
  bool get isMaterialPartsFetched => _isMaterialPartsFetched;

  bool _isRequestedListFetched = false;
  bool get isRequestedMaterialListFetched => _isRequestedListFetched;

  bool _isDocumantListFetched = false;
  bool get isDocumantListFetched => _isDocumantListFetched;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void fetchDocumants() {
    _isLoading = true;
    _isDocumantListFetched = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 5), () {
      _isLoading = false;
      notifyListeners();
    });
  }

  void fetchMaterials() {
    _isLoading = true;
    _isMaterialPartsFetched = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 5), () {
      _isLoading = false;
      notifyListeners();
    });
  }

  void fetchRequestedMaterials() {
    _isLoading = true;
    _isRequestedListFetched = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 5), () {
      _isLoading = false;
      notifyListeners();
    });
  }

  void fetchEfforts() {
    _isLoading = true;
    _isEffortListFetched = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 5), () {
      _isLoading = false;
      notifyListeners();
    });
  }
}
