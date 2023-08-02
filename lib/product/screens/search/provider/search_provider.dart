import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:vm_fm_4/feature/models/home_page_models/asset_list_model.dart';

import '../../../../../../feature/database/shared_manager.dart';
import '../../../../../../feature/enums/shared_enums.dart';
import '../../../../../../feature/injection.dart';
import '../../../../../../feature/models/work_space/work_space_detail.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

class SearchMaterialProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  AssetListModel? _assetDetailList;
  AssetListModel? get assetDetailList => _assetDetailList;


  final _woNumber = TextEditingController();
  final _assetNumber = TextEditingController();

  TextEditingController get woNumber => _woNumber;

  TextEditingController get assetNumber => _assetNumber;

  set setWoNumber(String woNumber) {
    _woNumber.text = woNumber;
    notifyListeners();
  }

  set setassetNumber(String assetNumber) {
    _assetNumber.text = assetNumber;
    notifyListeners();
  }

  getAssetWithSearch() async {
    if (assetNumber.text != '') {
      String userToken = await SharedManager().getString(SharedEnum.userToken);

      _isLoading = true;
      notifyListeners();
      final result = await workSpaceService.getAssetWithSearch(assetNumber.text, userToken);

      result.fold((l) => {_assetDetailList = l, _isSuccess = true}, (r) {
        _isSuccess = true;
        _assetDetailList = null;
      });

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

  void scanBarcodeAndQrForAsset() async {
    dynamic barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'İptal', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (barcodeScanRes != '-1') {
      final startIndex = barcodeScanRes.indexOf(':');
      final endIndex = barcodeScanRes.indexOf(',');
      final finalBarcode = barcodeScanRes.substring(startIndex +1, endIndex);
      setassetNumber = finalBarcode;
    }
    notifyListeners();
  }

  void onChangedFunction(String workOrderNumber) {
    setWoNumber = workOrderNumber;
  }

  void clearInput() {
    print('girdi');
    _isSuccess = false;
    _assetDetailList = null;
    setWoNumber = '';
    notifyListeners();
  }
}
