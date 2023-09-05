import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:vm_fm_4/core/route/app_route.gr.dart';

import '../../../../../../core/database/shared_manager.dart';
import '../../../../../../core/enums/shared_enums.dart';
import '../../../../../../feature/injection.dart';
import '../../../../../../feature/models/work_space/work_space_detail.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

class SearchWorkOrderProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  WorkSpaceDetail? _woDetailList;
  WorkSpaceDetail? get woDetailList => _woDetailList;
  final _woNumber = TextEditingController();

  TextEditingController get woNumber => _woNumber;

  set setWoNumber(String woNumber) {
    _woNumber.text = woNumber;
    notifyListeners();
  }

  void getWorkSpaceWithSearchFromGroupWorks(BuildContext context, String taskId) async {
    String userToken = await SharedManager().getString(SharedEnum.userToken);
    final result = await workSpaceService.getWorkSpaceWithSearchFromGroupWorks(taskId, userToken);

    result.fold(
        (l) => {
              context.router.push(DetailWorkOrderScreen(workSpaceDetail: l)),
              context.router.pop(),
            },
        (r) {});
  }

  void getWorkOrderWithSearch() async {
    if (woNumber.text != '') {
      String userToken = await SharedManager().getString(SharedEnum.userToken);

      _isLoading = true;
      notifyListeners();
      final result = await workSpaceService.getWorkSpaceWithSearchFromGroupWorks(woNumber.text, userToken);

      result.fold((l) => {_woDetailList = l, _isSuccess = true}, (r) {
        _isSuccess = true;
        _woDetailList = null;
      });

      // isSuccess
      //     ? woDetailList != null
      //         ? context.router.push(DetailWorkOrderScreen(
      //             workSpaceDetail: woDetailList!))
      //         : null
      //     : null;
      notifyListeners();

      _isLoading = false;
      notifyListeners();
    }
  }

  void scanBarcodeAndQr() async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'İptal', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (barcodeScanRes != '-1') {
      setWoNumber = barcodeScanRes;
    }
    notifyListeners();
  }

  void onChangedFunction(String workOrderNumber) {
    setWoNumber = workOrderNumber;
  }

  void clearInput() {
    _isSuccess = false;
    _woDetailList = null;
    setWoNumber = '';
    notifyListeners();
  }
}
