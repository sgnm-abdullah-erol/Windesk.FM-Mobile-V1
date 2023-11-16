import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_current_state.dart';

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

  bool _isFetchGroupIds = true;
  bool get isFetchGroupIds => _isFetchGroupIds;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String selectedTaskState = '';

  bool _isTaskStateChange = false;
  bool get isTaskStateChange => _isTaskStateChange;

  bool errorWhileGetuserGroups = false;

  CurrentState? _workSpaceStateGroups = const CurrentState();
  CurrentState? get workSpaceStateGroups => _workSpaceStateGroups;

  void onChangedSelectedTask(String val) {
    selectedTaskState = val;
  }

  void getStateUserGroups(String taskId, String workSpaceId) async {
    _isFetchGroupIds = false;
    _isLoading = true;
    notifyListeners();

    String userToken = await SharedManager().getString(SharedEnum.userToken);

    final response = await workSpaceService.getWorkSpaceStateGroups(taskId, workSpaceId, userToken);

    response.fold(
      (l) => {
        _workSpaceStateGroups = l,
      },
      (r) => {
        errorWhileGetuserGroups = true,
      },
    );
    notifyListeners();

    _isLoading = false;
  }

  // TODO
  void changeState(String taskId, String stateId, bool isReject) async {
    _isLoading = true;
    notifyListeners();

    final token = await SharedManager().getString(SharedEnum.userToken);
    final response = await workSpaceService.changeWorkSpaceState(taskId, stateId, token, 'groupId');

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
