import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

import '../../../../../../feature/injection.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';
import '../../../../core/database/shared_manager.dart';
import '../../../../core/enums/shared_enums.dart';
import '../../../../feature/components/snackBar/snackbar.dart';
import '../../../../feature/models/home_page_models/asset_document_model.dart';
import '../../../../feature/models/home_page_models/asset_image_model.dart';
import '../../../../feature/models/home_page_models/asset_list_model.dart';

class SearchMaterialProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  bool _errorAccure = false;
  bool get errorAccure => _errorAccure;

  bool _imageExist = false;
  bool get imageExist => _imageExist;

  bool _documentExist = false;
  bool get documentExist => _documentExist;

  String _qrType = '';
  String get qrType => _qrType;

  AssetListModel? _assetDetailList;
  AssetListModel? get assetDetailList => _assetDetailList;
  Map? _spaceData;
  Map? get spaceData => _spaceData;

  final List<AssetImageModel> _imageModel = [];
  List<AssetImageModel> get imageModel => _imageModel;

  final List<AssetDocumentModel> _documentModel = [];
  List<AssetDocumentModel> get documentModel => _documentModel;

  final _woNumber = TextEditingController();
  final _assetNumber = TextEditingController();
  final _spaceText = TextEditingController();

  TextEditingController get woNumber => _woNumber;

  TextEditingController get assetNumber => _assetNumber;
  TextEditingController get spaceText => _spaceText;

  set setWoNumber(String woNumber) {
    _woNumber.text = woNumber;
    notifyListeners();
  }

  set setassetNumber(String assetNumber) {
    _assetNumber.text = assetNumber;
    notifyListeners();
  }

  set setSpaceText(String spaceText) {
    _spaceText.text = spaceText;
  }

  void setQrType(String qrType) {
    _qrType = qrType;
  }

  showWidget(data) {
    return SizedBox(
      child: TreeView(nodes: [
        TreeNode(content: const Text("root1")),
        TreeNode(
          content: const Text("root2"),
          children: [
            TreeNode(content: const Text("child21")),
            TreeNode(content: const Text("child22")),
            TreeNode(
              content: const Text("root23"),
              children: [
                TreeNode(content: const Text("child231")),
              ],
            ),
          ],
        ),
      ]),
    );
  }

  void spaceSearch(context) async {
    String userToken = await SharedManager().getString(SharedEnum.userToken);
    _spaceData = null;
    notifyListeners();

    _isLoading = true;
    notifyListeners();
    final result = await workSpaceService.getSpaceSearch(spaceText.text, userToken);

    result.fold((l) => {_spaceData = l}, (r) {
      snackBar(context, LocaleKeys.spaceSearchError, 'error');
      _assetDetailList = null;
    });

    _isLoading = false;
    notifyListeners();
  }

  void getAssetWithSearch() async {
    if (assetNumber.text != '') {
      _imageModel.clear();
      _documentModel.clear();
      _imageExist = false;
      _documentExist = false;
      String userToken = await SharedManager().getString(SharedEnum.userToken);

      final endIndexAsset = assetNumber.text.indexOf('-');
      final String  identifierBarcode= assetNumber.text.substring(0, endIndexAsset);
      final String  tagNumberBarcode= assetNumber.text.substring(endIndexAsset + 1);

      _isLoading = true;
      notifyListeners();
      final result = _qrType == '' || _qrType == 'Etiket Numarası'
          ? await workSpaceService.getAssetWithSearchTagNumber(tagNumberBarcode, userToken)
          : await workSpaceService.getAssetWithSearchIdentifier(identifierBarcode, userToken);

      result.fold(
          (l) => {
                _assetDetailList = l,
                _isSuccess = true,
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
              }, (r) {
        _errorAccure = true;
        _assetDetailList = null;
      });

      _isLoading = false;
      notifyListeners();

      Future.delayed(const Duration(seconds: 2), () {
        _isSuccess = false;
        _errorAccure = false;
        notifyListeners();
      });
    }
  }

  getSpaceSearch() {}

  void scanBarcodeAndQrForAsset() async {
    dynamic barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'İptal', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (barcodeScanRes != '-1') {
      final startIndexAsset = barcodeScanRes.indexOf(':"');
      final endIndexAsset = barcodeScanRes.indexOf('",');
      final assetBarcode = barcodeScanRes.substring(startIndexAsset + 2, endIndexAsset);

      final startIndexTag = barcodeScanRes.indexOf('Number":"');
      final endIndexTag = barcodeScanRes.indexOf('"}');
      final tagBarcode = barcodeScanRes.substring(startIndexTag + 9, endIndexTag);
      print('fbarcode' + assetBarcode + 'tbarcode' + tagBarcode);

      setassetNumber = assetBarcode + '-' + tagBarcode;
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
    assetNumber.text = '';
    notifyListeners();
  }
}
