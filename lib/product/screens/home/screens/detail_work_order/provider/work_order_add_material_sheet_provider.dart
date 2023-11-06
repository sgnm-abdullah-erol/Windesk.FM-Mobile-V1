import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';

import '../../../../../../core/database/shared_manager.dart';
import '../../../../../../core/enums/shared_enums.dart';
import '../../../../../../feature/injection.dart';
import '../../../../../../feature/models/work_space/work_space_user_inventory.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';
import '../../../../../../generated/locale_keys.g.dart';

class WorkOrderAddMaterialSheetProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isInventoryFetched = false;
  bool get isInventoryFetched => _isInventoryFetched;

  String _hintAmount = LocaleKeys.MaterialAmount.tr();
  String get hintAmount => _hintAmount;

  String _hintUnit = LocaleKeys.MaterialUnit.tr();
  String get hintUnit => _hintUnit;

  String _choosenMaterial = '';
  String get choosenMaterial => _choosenMaterial;

  String _wantedMaterialAmount = '0';
  String get wantedMaterialAmount => _wantedMaterialAmount;

  // for spareparts
  WorkSpaceUserInventory _userInventoryList = const WorkSpaceUserInventory();
  WorkSpaceUserInventory get userInventoryList => _userInventoryList;

  List<String> workSpaceUserInventoryLabelList = [];

  void setChoosenMaterial(String val) => _choosenMaterial = val;
  void setWantedMaterialAmount(String val) => _wantedMaterialAmount = wantedMaterialAmount;

  void changeWantedMaterialAmount(String value) {
    _wantedMaterialAmount = value;
  }

  void setHintTexts(String value) {
    _choosenMaterial = value;
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

  void addSparepart(BuildContext context, String taskId) async {
    if (wantedMaterialAmount == '0' || wantedMaterialAmount.isEmpty || choosenMaterial.isEmpty) {
      snackBar(context, LocaleKeys.EmptyMaterialWantedAmount.tr(), 'error');
      Navigator.of(context).pop();

      return;
    }

    _isLoading = true;
    notifyListeners();

    String userToken = await SharedManager().getString(SharedEnum.userToken);
    String sparePartId = '';
    for (var i = 0; i < (_userInventoryList.materials?.length ?? 0); i++) {
      if (_userInventoryList.materials?[i].properties?.name == _choosenMaterial) {
        sparePartId = _userInventoryList.materials?[i].properties?.referenceId.toString() ?? '';
        break;
      }
    }

    final result = await workSpaceService.addWorkSpaceSpareparts(taskId, userToken, sparePartId, wantedMaterialAmount);

    result.fold(
      (l) => {
        snackBar(context, LocaleKeys.MaterialAdded.tr(), 'true'),
        Navigator.of(context).pop(),
      },
      (r) => {
        snackBar(context, LocaleKeys.MaterialError.tr(), 'error'),
        Navigator.of(context).pop(),
      },
    );

    _isLoading = false;
    notifyListeners();
  }
}
