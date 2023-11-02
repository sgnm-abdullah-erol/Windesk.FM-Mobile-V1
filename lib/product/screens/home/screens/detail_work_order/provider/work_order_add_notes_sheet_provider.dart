// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:vm_fm_4/core/database/shared_manager.dart';
import 'package:vm_fm_4/core/enums/shared_enums.dart';

import '../../../../../../feature/injection.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

class WorkOrderAddNotesProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  bool isLoading = false;
  bool addNoteSuccess = false;
  bool errorAccur = false;
  void addNote(BuildContext context, String taskId, String content) async {
    isLoading = true;
    notifyListeners();

    String userToken = await SharedManager().getString(SharedEnum.userToken);
    final response = await workSpaceService.addNoteToWorkOrder(userToken, '1', content);

    isLoading = false;
    notifyListeners();

    if (response == true) {
      addNoteSuccess = true;
      notifyListeners();
    } else {
      errorAccur = true;
      notifyListeners();
    }
  }
}
