import 'package:flutter/material.dart';

import '../../../../../../feature/database/shared_manager.dart';
import '../../../../../../feature/enums/shared_enums.dart';
import '../../../../../../feature/injection.dart';
import '../../../../../../feature/models/work_space/work_space_user_inventory.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

class WorkOrderAddMaterialSheetProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isInventoryFetched = false;
  bool get isInventoryFetched => _isInventoryFetched;

  String _hintAmount = 'Malzeme miktari';
  String get hintAmount => _hintAmount;

  String _hintUnit = 'Malzeme unit';
  String get hintUnit => _hintUnit;

  String _wantedMaterialAmount = '0';
  String get wantedMaterialAmount => _wantedMaterialAmount;

  // for spareparts
  WorkSpaceUserInventory _userInventoryList = const WorkSpaceUserInventory();
  WorkSpaceUserInventory get userInventoryList => _userInventoryList;

  List<String> workSpaceUserInventoryLabelList = [];

  void changeWantedMaterialAmount(String value) {
    _wantedMaterialAmount = value;
  }

  void setHintTexts(String value) {
    for (var i = 0; i < (_userInventoryList.materials?.length ?? 0); i++) {
      if (_userInventoryList.materials?[i].properties?.name == value) {
        _hintAmount = _userInventoryList.materials?[i].properties?.count.toString() ?? '';
        _hintUnit = _userInventoryList.materials?[i].properties?.measurementUnit ?? '';
        notifyListeners();
        break;
      }
    }
  }

  void getUserInventory() async {
    _isLoading = true;
    _isInventoryFetched = true;
    notifyListeners();

    String userToken = await SharedManager().getString(SharedEnum.userToken);

    final result = await workSpaceService.getWorkSpaceUserInventory(userToken);

    result.fold(
      (l) => {
        _userInventoryList = l,
        for (var i = 0; i < (_userInventoryList.materials?.length ?? 0); i++)
          {
            workSpaceUserInventoryLabelList.add(_userInventoryList.materials?[i].properties?.name ?? ''),
          },
      },
      (r) => {},
    );

    _isLoading = false;
    notifyListeners();
  }
}
