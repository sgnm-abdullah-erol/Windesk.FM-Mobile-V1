import 'package:flutter/material.dart';
import '../../../../../../feature/injection.dart';
import '../../../../../../feature/models/work_space/work_space_efforts.dart';

import '../../../../../../feature/database/shared_manager.dart';
import '../../../../../../feature/enums/shared_enums.dart';
import '../../../../../../feature/models/work_space/work_space_detail.dart';
import '../../../../../../feature/models/work_space/work_space_spareparts.dart';
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

  // work space effort list
  List<WorkSpaceEfforts>? _woEffortList;
  List<WorkSpaceEfforts>? get woEffortList => _woEffortList;

  bool _isWorkOrderEffortListFetched = false;
  bool get isWorkOrderEffortListFetched => _isWorkOrderEffortListFetched;

  void getEfforts(String taskId, String nextStateId) async {
    String userToken = await SharedManager().getString(SharedEnum.userToken);

    _isLoading = true;
    _isWorkOrderEffortListFetched = true;
    notifyListeners();
    final result = await workSpaceService.getWorkSpaceEfforts(taskId, userToken);

    result.fold(
      (l) => {
        _woEffortList = l,
        notifyListeners(),
      },
      (r) {},
    );
    _isLoading = false;
    notifyListeners();
  }
}

class WorkOrderDetailServiceProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  bool _isEffortListFetched = false;
  bool get isEffortListFetched => _isEffortListFetched;

  bool _isSparepartsFetched = false;
  bool get isMaterialPartsFetched => _isSparepartsFetched;

  bool _isRequestedListFetched = false;
  bool get isRequestedMaterialListFetched => _isRequestedListFetched;

  bool _isDocumantListFetched = false;
  bool get isDocumantListFetched => _isDocumantListFetched;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<WorkSpaceEfforts>? _woEffortList;
  List<WorkSpaceEfforts>? get woEffortList => _woEffortList;

  List<WorkSpaceSpareparts>? _woSpareparts;
  List<WorkSpaceSpareparts>? get woSpareparts => _woSpareparts;

  void update() {
    notifyListeners();
  }

  void fetchDocumants() {
    _isLoading = true;
    _isDocumantListFetched = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 5), () {
      _isLoading = false;
      notifyListeners();
    });
  }

  void fetchSpareparts(String taskId) async {
    _isLoading = true;
    _isSparepartsFetched = true;
    notifyListeners();

    String userToken = await SharedManager().getString(SharedEnum.userToken);
    final result = await workSpaceService.getWorkSpaceSpareparts(taskId, userToken);

    result.fold(
      (l) => {
        _woSpareparts = l,
      },
      (r) => {
        _isSparepartsFetched = false,
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  void fetchRequestedMaterials() {
    _isLoading = true;
    _isRequestedListFetched = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 5), () {
      _isLoading = false;
      notifyListeners();
    });
  }

  void fetchEfforts(String taskId, String nextStateId) async {
    _isLoading = true;
    _isEffortListFetched = true;

    notifyListeners();

    String userToken = await SharedManager().getString(SharedEnum.userToken);
    final result = await workSpaceService.getWorkSpaceEfforts(taskId, userToken);

    result.fold(
      (l) => {
        _woEffortList = l,
      },
      (r) {},
    );
    _isLoading = false;
    notifyListeners();
  }
}
