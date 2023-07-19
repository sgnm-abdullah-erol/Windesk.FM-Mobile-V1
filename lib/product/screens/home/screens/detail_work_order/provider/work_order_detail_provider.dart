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
