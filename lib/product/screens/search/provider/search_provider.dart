import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../../../../../feature/injection.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';
import '../../../../core/database/shared_manager.dart';
import '../../../../core/enums/shared_enums.dart';
import '../../../../feature/models/home_page_models/asset_document_model.dart';
import '../../../../feature/models/home_page_models/asset_image_model.dart';
import '../../../../feature/models/home_page_models/asset_list_model.dart';

class SearchMaterialProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  bool _imageExist = false;
  bool get imageExist => _imageExist;

  bool _documentExist = false;
  bool get documentExist => _documentExist;

  AssetListModel? _assetDetailList;
  AssetListModel? get assetDetailList => _assetDetailList;

  final List<AssetImageModel> _imageModel = [];
  List<AssetImageModel> get imageModel => _imageModel;

  final List<AssetDocumentModel> _documentModel = [];
  List<AssetDocumentModel> get documentModel => _documentModel;

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
      _imageModel.clear();
      _documentModel.clear();
      _imageExist = false;
      _documentExist = false;
      String userToken = await SharedManager().getString(SharedEnum.userToken);

      _isLoading = true;
      notifyListeners();
      final result = await workSpaceService.getAssetWithSearch(assetNumber.text, userToken);

      result.fold(
          (l) => {
                _assetDetailList = l,
                if (l.images!.isNotEmpty)
                  {
                    for (int i = 0; i < l.images!.length; i++) {_imageModel.add(l.images![i])},
                    _imageExist = true,
                  },
                if (l.documents!.isNotEmpty)
                  {
                    for (int i = 0; i < l.documents!.length; i++) {_documentModel.add(l.documents![i])},
                    _documentExist = true,
                  },
                _isSuccess = true
              }, (r) {
        _isSuccess = true;
        _assetDetailList = null;
      });

      _isLoading = false;
      notifyListeners();
    }
  }

  void scanBarcodeAndQrForAsset() async {
    dynamic barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'İptal', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (barcodeScanRes != '-1') {
      // final startIndex = barcodeScanRes.indexOf(':');
      // final endIndex = barcodeScanRes.indexOf(',');
      // final finalBarcode = barcodeScanRes.substring(startIndex + 1, endIndex);
      setassetNumber = barcodeScanRes;
    }
    notifyListeners();
  }

  void onChangedFunction(String workOrderNumber) {
    setWoNumber = workOrderNumber;
  }

  void clearInput() {
    _isSuccess = false;
    _assetDetailList = null;
    setWoNumber = '';
    notifyListeners();
  }
}
