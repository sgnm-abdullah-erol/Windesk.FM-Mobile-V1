import 'package:flutter/material.dart';

import '../../../../../../feature/exceptions/custom_service_exceptions.dart';
import '../../../../../../feature/injection.dart';
import '../../../../../../feature/models/work_order_models/work_order_details_model.dart';
import '../../../../../../feature/service/global_services.dart/work_order_service/work_order_service_repository_impl.dart';

class WorkOrderDetailProvider extends ChangeNotifier {
  final WorkOrderServiceRepositoryImpl service = Injection.getIt.get<WorkOrderServiceRepositoryImpl>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  WorkOrderDetailsModel _woDetailList = const WorkOrderDetailsModel();
  WorkOrderDetailsModel get woDetailList => _woDetailList;

  Future<WorkOrderDetailsModel> getWorkOrderDetails(String workOrderCode) async {
    print('asdasdasd');
    _isLoading = true;
    notifyListeners();
    final result = await WorkOrderServiceRepositoryImpl().getWorkOrderDetails(workOrderCode);
      result.fold((l) => _woDetailList = l, (r) {});
      notifyListeners();

      _isLoading = false;
      notifyListeners();
      return _woDetailList;

  }
}
