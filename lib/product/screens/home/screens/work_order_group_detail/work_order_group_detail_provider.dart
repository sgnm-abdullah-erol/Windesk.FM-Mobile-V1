// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:vm_fm_4/core/database/shared_manager.dart';
import 'package:vm_fm_4/core/enums/shared_enums.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_detail.dart';

import '../../../../../feature/injection.dart';
import '../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

class WorkOrderGroupDetailProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl _workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isGroupWorkOrdersDataFetched = false;
  bool get isGroupWorkOrdersDataFetched => _isGroupWorkOrdersDataFetched;

  List<WorkSpaceDetail> _workSpaceGroupWorkOrdersList = [];
  List<WorkSpaceDetail> get workSpaceGroupWorkOrdersList => _workSpaceGroupWorkOrdersList;

  void getGroupSpaceOrders(String requestId) async {
    _isLoading = true;
    _isGroupWorkOrdersDataFetched = true;
    notifyListeners();

    final userToken = await SharedManager().getString(SharedEnum.userToken);

    await _workSpaceService.getWorkSpaceDetailsByRequestType(requestId, 1, userToken).then((value) {
      value.fold(
        (l) {
          _workSpaceGroupWorkOrdersList = l;
          notifyListeners();
        },
        (r) {},
      );
    });

    _isLoading = false;
    _isGroupWorkOrdersDataFetched = true;
    notifyListeners();
  }
}
