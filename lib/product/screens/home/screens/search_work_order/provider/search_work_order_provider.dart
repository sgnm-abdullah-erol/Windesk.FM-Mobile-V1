import 'package:flutter/material.dart';

import '../../../../../../feature/database/shared_manager.dart';
import '../../../../../../feature/enums/shared_enums.dart';
import '../../../../../../feature/injection.dart';
import '../../../../../../feature/models/work_space/work_space_detail.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

class SearchWorkOrderProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  String _woNumber = '';
  String get woNumber => _woNumber;

  WorkSpaceDetail? _woDetailList;
  WorkSpaceDetail? get woDetailList => _woDetailList;

  void getWorkOrderWithSearch(String workOrderCode) async {
    String userToken = await SharedManager().getString(SharedEnum.userToken);

    _isLoading = true;
    notifyListeners();
    final result = await workSpaceService.getWorkSpaceWithSearch(workOrderCode, userToken);

    result.fold((l) => {_woDetailList = l, _isSuccess = true}, (r) {});
    notifyListeners();

    _isLoading = false;
    notifyListeners();
  }

  void onChangedFunction(String workOrderNumber) {
    _woNumber = workOrderNumber;
  }
}
