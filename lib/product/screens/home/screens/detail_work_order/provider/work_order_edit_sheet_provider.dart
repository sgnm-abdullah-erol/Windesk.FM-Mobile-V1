import 'package:flutter/material.dart';
import 'package:vm_fm_4/core/database/shared_manager.dart';
import 'package:vm_fm_4/core/enums/shared_enums.dart';
import 'package:vm_fm_4/core/enums/task_node_enums.dart';
import 'package:vm_fm_4/feature/injection.dart';
import 'package:vm_fm_4/feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

class WorkOrderEditSheetProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  bool editNoteSuccess = false;
  bool errorAccur = false;
  bool isLoading = false;

  void editNote(BuildContext context, String taskId, String text, String labelId) async {
    isLoading = true;
    notifyListeners();

    String userToken = await SharedManager().getString(SharedEnum.userToken);
    final response = await workSpaceService.deleteNodeFromTask(userToken, taskId, labelId, TaskNodeEnums.note);

    if (response == true) {
      final response = await workSpaceService.addNoteToWorkOrder(userToken, taskId, text);
      if (response == true) {
        editNoteSuccess = true;
      } else {
        errorAccur = true;
      }
    }

    isLoading = false;
    notifyListeners();
  }
}
