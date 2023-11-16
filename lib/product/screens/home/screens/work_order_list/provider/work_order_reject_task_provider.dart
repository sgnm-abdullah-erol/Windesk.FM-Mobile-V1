import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/core/database/shared_manager.dart';
import 'package:vm_fm_4/core/enums/shared_enums.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/feature/injection.dart';
import 'package:vm_fm_4/feature/models/reject_state_models/reject_state_model.dart';
import 'package:vm_fm_4/feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

class WorkOrderRejectTaskProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  bool isLoading = false;
  bool isInitState = true;
  bool showGroupSelection = false;

  List<RejectStateModel> stateModel = [];
  List<String> groupNames = [];
  List<String> stateNames = [];

  String choosenStateName = '';
  String choosenGroupName = '';

  Future<void> init(String workSpaceId, String taskId) async {
    if (isInitState) {
      isInitState = false;
      await getRejectStates(workSpaceId, taskId);
    }
  }

  Future<void> getRejectStates(String workSpaceId, String taskId) async {
    _changeLoading();
    String userToken = await SharedManager().getString(SharedEnum.userToken);

    final response = await workSpaceService.getWorkSpaceRejectStateGroups(taskId, workSpaceId, userToken);
    stateModel = response;
    _setStateNames();

    _changeLoading();
  }

  void onChangeStateName(String val) {
    showGroupSelection = true;
    choosenStateName = val;
    setGroupNames(val);
    notifyListeners();
  }

  void onChangeGroupName(String val) {
    choosenGroupName = val;
  }

  void setGroupNames(String stateName) {
    for (var element in stateModel) {
      if (element.name == stateName) {
        for (var group in element.userGroups ?? []) {
          groupNames.add(group.name ?? '');
        }
      }
    }
  }

  void _setStateNames() {
    for (var element in stateModel) {
      stateNames.add(element.name ?? '');
    }

    stateNames.remove('');
  }

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void rejectState(String workSpaceId, String taskId, BuildContext context) async {
    _changeLoading();
    String userToken = await SharedManager().getString(SharedEnum.userToken);

    // find stateId
    String stateId = '';
    for (var element in stateModel) {
      if (element.name == choosenStateName) {
        stateId = element.id.toString();
      }
    }

    // find group id
    String groupId = '';
    for (var element in stateModel) {
      if (element.name == choosenStateName) {
        for (var group in element.userGroups ?? []) {
          if (group.name == choosenGroupName) {
            groupId = group.id.toString();
          }
        }
      }
    }

    final response = await workSpaceService.changeWorkSpaceState(taskId, stateId, userToken, groupId);

    response.fold(
      (l) async => {
        _changeLoading(),
        snackBar(context, LocaleKeys.TaskStateRejected.tr(), 'success'),
        Navigator.pop(context, true),
      },
      (r) => {
        _changeLoading(),
        snackBar(context, LocaleKeys.StateError.tr(), 'success'),
        Navigator.pop(context, false),
      },
    );
  }
}
