import 'package:flutter/material.dart';

import '../../../../../../feature/database/shared_manager.dart';
import '../../../../../../feature/enums/shared_enums.dart';
import '../../../../../../feature/injection.dart';
import '../../../../../../feature/models/work_space/work_space_detail.dart';
import '../../../../../../feature/models/work_space/work_space_efforts.dart';
import '../../../../../../feature/models/work_space/work_space_user_inventory.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

class WorkOrderDetailProvider extends ChangeNotifier {
  WorkOrderDetailProvider({required this.detail});
  final WorkSpaceDetail detail;

  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  // for page
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _userClickedEfforts = false;
  bool get userClickedEfforts => _userClickedEfforts;

  bool _userClickedMaterial = false;
  bool get userClickedMaterial => _userClickedMaterial;

  bool _userClickedRequestedMaterial = false;
  bool get userClickedRequestedMaterial => _userClickedRequestedMaterial;

  bool _userClickedDocumants = false;
  bool get userClickedDocumants => _userClickedDocumants;

  void userClickedEffortsFunction() {
    _userClickedEfforts = true;
  }

  void userClickedMaterialFunction() {
    _userClickedMaterial = true;
  }

  void userClickedRequestedMaterialFunction() {
    _userClickedRequestedMaterial = true;
  }

  void userClickedDocumantsFunction() {
    _userClickedDocumants = true;
  }

  // for efforts
  // work space effort list
  List<WorkSpaceEfforts>? _woEffortList;
  List<WorkSpaceEfforts>? get woEffortList => _woEffortList;

  bool _effortAdded = false;
  bool get effortAdded => _effortAdded;

  String _startEffortDate = '';
  String get startEffortDate => _startEffortDate;

  String _endEffortDate = '';
  String get endEffortDate => _endEffortDate;

  String _effortDuration = '';
  String get effortDuration => _effortDuration;

  String _effortType = '';
  String get effortType => _effortType;

  String _effortDescription = '';
  String get effortDescription => _effortDescription;

  void setEffortDescription(String value) {
    _effortDescription = value;
  }

  void setEffortType(String value) {
    _effortType = value;
  }

  void setEffortDuration(String value) {
    _effortDuration = value;
  }

  void setStartEffortDate(String value) {
    _startEffortDate = value;
  }

  void setEndEffortDate(String value) {
    _endEffortDate = value;
  }

  void addEffort() async {
    // service add effort
    String userToken = await SharedManager().getString(SharedEnum.userToken);

    _isLoading = true;
    notifyListeners();

    final result = await workSpaceService.addWorkOrderEffort(
      detail.task?.id.toString() ?? '',
      userToken,
      _effortDescription,
      _effortDuration,
      _startEffortDate,
      _endEffortDate,
      _effortType,
    );

    result.fold(
      (l) => {
        _effortAdded = true,
      },
      (r) => {
        _effortAdded = false,
      },
    );

    _isLoading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _effortAdded = false;
    });
  }

  // for spareparts
  WorkSpaceUserInventory _userInventoryList = const WorkSpaceUserInventory();
  WorkSpaceUserInventory get userInventoryList => _userInventoryList;

  List<String> workSpaceUserInventoryLabelList = [];

  void getUserInventory() async {
    _isLoading = true;
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
