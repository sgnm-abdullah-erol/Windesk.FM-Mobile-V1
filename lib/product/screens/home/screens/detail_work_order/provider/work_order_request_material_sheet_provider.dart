import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_requested_materials_inventory.dart';

import '../../../../../../feature/database/shared_manager.dart';
import '../../../../../../feature/enums/shared_enums.dart';
import '../../../../../../feature/injection.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

class WorkOrderRequestMaterialSheetProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isInventoryFetched = false;
  bool get isInventoryFetched => _isInventoryFetched;

  String _subject = '';
  String get subject => _subject;

  String _description = '';
  String get description => _description;

  String _hintAmount = 'Malzeme Miktarı';
  String get hintAmount => _hintAmount;

  String _hintUnit = 'Malzeme Birimi';
  String get hintUnit => _hintUnit;

  String _wantedMaterialAmount = '';
  String get wantedMaterialAmount => _wantedMaterialAmount;

  List<WorkSpaceRequestedMaterialsInventory> _workSpaceRequestedMaterialsInventory = [];
  List<WorkSpaceRequestedMaterialsInventory> get workSpaceRequestedMaterialsInventory => _workSpaceRequestedMaterialsInventory;

  final List<String> _workSpaceUserInventoryLabelList = [];
  List<String> get workSpaceUserInventoryLabelList => _workSpaceUserInventoryLabelList;

  void changeSubject(String value) {
    _subject = value;
  }

  void changeDescription(String value) {
    _description = value;
  }

  void changeWantedMaterialAmount(String value) {
    _wantedMaterialAmount = value;
  }

  void changeHintTexts(String value) {
    for (var i = 0; i < _workSpaceRequestedMaterialsInventory.length; i++) {
      if (value == workSpaceRequestedMaterialsInventory[i].name) {
        _hintAmount = workSpaceRequestedMaterialsInventory[i].amount.toString();
        _hintUnit = workSpaceRequestedMaterialsInventory[i].measurementUnit ?? '';
        notifyListeners();
        break;
      }
    }
  }

  void fetchRequestedMaterials() async {
    _isLoading = true;
    _isInventoryFetched = true;
    notifyListeners();

    String userToken = await SharedManager().getString(SharedEnum.userToken);
    final result = await workSpaceService.getWorkSpaceRequestedMaterialsInventory(userToken, 1);

    result.fold(
      (l) => {
        _workSpaceRequestedMaterialsInventory = l,
      },
      (r) => {
        _isInventoryFetched = false,
      },
    );

    for (var i = 0; i < _workSpaceRequestedMaterialsInventory.length; i++) {
      _workSpaceUserInventoryLabelList.add(_workSpaceRequestedMaterialsInventory[i].name ?? '');
    }

    _isLoading = false;
    notifyListeners();
  }
}
