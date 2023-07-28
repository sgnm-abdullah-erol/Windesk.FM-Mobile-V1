import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/database/shared_manager.dart';
import 'package:vm_fm_4/feature/enums/shared_enums.dart';

import '../../../../../../feature/injection.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

class WorkOrderPendiksProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String selectedTaskState = '';

  bool _isTaskStateChange = false;
  bool get isTaskStateChange => _isTaskStateChange;

  void onChangedSelectedTask(String val) {
    selectedTaskState = val;
  }

  void changeState(String taskId, String stateId) async {
    _isLoading = true;
    notifyListeners();

    print(taskId);
    print(stateId);

    final token = await SharedManager().getString(SharedEnum.userToken);

    final response = await workSpaceService.changeWorkSpaceState(taskId, stateId, token);

    response.fold(
      (l) => {
        _isTaskStateChange = true,
      },
      (r) => {
        _isTaskStateChange = false,
      },
    );

    _isLoading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 1), () {
      _isTaskStateChange = false;
    });
  }
}
