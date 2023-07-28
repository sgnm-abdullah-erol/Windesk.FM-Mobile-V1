import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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

  WorkSpaceDetail? _woDetailList;
  WorkSpaceDetail? get woDetailList => _woDetailList;

  void getWorkOrderWithSearch() async {
    String userToken = await SharedManager().getString(SharedEnum.userToken);

    _isLoading = true;
    notifyListeners();
    final result = await workSpaceService.getWorkSpaceWithSearch(woNumber.text, userToken);

    result.fold((l) => {_woDetailList = l, _isSuccess = true}, (r) {});
    notifyListeners();

    _isLoading = false;
    notifyListeners();
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

  final _woNumber = TextEditingController();

  TextEditingController get woNumber => _woNumber;

  set setWoNumber(String woNumber) {
    _woNumber.text = woNumber;
    notifyListeners();
  }

  void onChangedFunction(String workOrderNumber) {
    setWoNumber = workOrderNumber;
  }

  void clearInput() {
    setWoNumber = '';
  }
}
