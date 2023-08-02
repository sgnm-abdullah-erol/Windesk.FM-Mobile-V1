import 'package:flutter/material.dart';
import '../../../../../../feature/models/work_space/work_space_requested_materials_inventory.dart';

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

  bool _isWorkOrderMaterialRequested = false;
  bool get isWorkOrderMaterialRequested => _isWorkOrderMaterialRequested;

  String _subject = '';
  String get subject => _subject;

  String _description = '';
  String get description => _description;

  String _hintAmount = 'Malzeme Miktarı';
  String get hintAmount => _hintAmount;

  String _hintUnit = 'Malzeme Birimi';
  String get hintUnit => _hintUnit;

  String _choosenMaterial = '';
  String get choosenMaterial => _choosenMaterial;

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
    _choosenMaterial = value;

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

  void addRequestedMaterial(String workSpaceId, String taskId) async {
    if (_wantedMaterialAmount == '0' || _wantedMaterialAmount.isEmpty || _subject.isEmpty || _hintAmount.isEmpty || _hintAmount == '0') return;

    _isLoading = true;
    notifyListeners();

    String userToken = await SharedManager().getString(SharedEnum.userToken);

    String materialId = '';

    for (var i = 0; i < _workSpaceRequestedMaterialsInventory.length; i++) {
      if (_workSpaceRequestedMaterialsInventory[i].name == _choosenMaterial) {
        materialId = _workSpaceRequestedMaterialsInventory[i].id.toString();
        break;
      }
    }

    if (materialId.isEmpty) return;

    await workSpaceService
        .requestWorkSpaceMaterial(
          workSpaceId,
          taskId,
          userToken,
          _subject,
          _description,
          _wantedMaterialAmount,
          materialId,
        )
        .then(
          (value) => value.fold(
            (l) => {
              _isWorkOrderMaterialRequested = true,
            },
            (r) => {
              _isWorkOrderMaterialRequested = false,
            },
          ),
        );

    _isLoading = false;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1), () {
      _isWorkOrderMaterialRequested = false;
    });
  }
}
