import 'package:flutter/material.dart';

import '../../../../../../core/database/shared_manager.dart';
import '../../../../../../core/enums/shared_enums.dart';
import '../../../../../../feature/injection.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

class WorkOrderPendiksProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  bool _isRejected = false;
  bool get isRejected => _isRejected;

  bool _isApproved = false;
  bool get isApproved => _isApproved;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String selectedTaskState = '';

  bool _isTaskStateChange = false;
  bool get isTaskStateChange => _isTaskStateChange;

  void onChangedSelectedTask(String val) {
    selectedTaskState = val;
  }

  void changeState(String taskId, String stateId, bool isReject) async {
    _isLoading = true;
    notifyListeners();

    final token = await SharedManager().getString(SharedEnum.userToken);
    final response = await workSpaceService.changeWorkSpaceState(taskId, stateId, token);

    response.fold(
      (l) => {
        if (isReject) _isRejected = true else _isApproved = true,
      },
      (r) => {
        _isTaskStateChange = false,
        _isApproved = false,
        _isRejected = false,
      },
    );

    _isLoading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _isTaskStateChange = false;
      _isRejected = false;
      _isApproved = false;
    });
  }
}
