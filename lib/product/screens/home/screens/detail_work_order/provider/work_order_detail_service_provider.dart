// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';

import '../../../../../../feature/database/shared_manager.dart';
import '../../../../../../feature/enums/shared_enums.dart';
import '../../../../../../feature/injection.dart';
import '../../../../../../feature/models/work_space/work_space_efforts.dart';
import '../../../../../../feature/models/work_space/work_space_requirement_materials_list.dart';
import '../../../../../../feature/models/work_space/work_space_spareparts.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

class WorkOrderDetailServiceProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  bool _isEffortListFetched = false;
  bool get isEffortListFetched => _isEffortListFetched;

  bool _isSparepartsFetched = false;
  bool get isMaterialPartsFetched => _isSparepartsFetched;

  bool _isDocumantListFetched = false;
  bool get isDocumantListFetched => _isDocumantListFetched;

  bool _isRequestedListFetched = false;
  bool get isRequestedMaterialListFetched => _isRequestedListFetched;

  bool _isRequstedApprovedMaterialListFetched = false;
  bool get isRequstedApprovedMaterialListFetched => _isRequstedApprovedMaterialListFetched;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<WorkSpaceEfforts>? _woEffortList;
  List<WorkSpaceEfforts>? get woEffortList => _woEffortList;

  List<WorkSpaceSpareparts>? _woSpareparts;
  List<WorkSpaceSpareparts>? get woSpareparts => _woSpareparts;

  List<WorkSpaceRequirementMaterialsList> _woRequestedMaterialsList = [];
  List<WorkSpaceRequirementMaterialsList> get woRequestedMaterialsList => _woRequestedMaterialsList;

  List<WorkSpaceRequirementMaterialsList> _woRequestedApprovedMaterialsList = [];
  List<WorkSpaceRequirementMaterialsList> get woRequestedApprovedMaterialsList => _woRequestedApprovedMaterialsList;

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

    Future.delayed(const Duration(seconds: 2), () {
      _isSparepartsFetched = false;
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

    Future.delayed(const Duration(seconds: 2), () {
      _isEffortListFetched = false;
    });
  }

  void fetchRequstedMaterials(String taskId) async {
    _isRequestedListFetched = true;
    _isLoading = true;

    notifyListeners();

    String userToken = SharedManager().getString(SharedEnum.userToken).toString();
    final result = await workSpaceService.getWorkSpaceRequirementMaterialsList(taskId, userToken);

    result.fold(
      (l) => {
        _woRequestedMaterialsList = l,
      },
      (r) => {},
    );

    _isLoading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _isRequestedListFetched = false;
    });
  }

  void fetchRequstedApprovedMaterials(String taskId) async {
    _isRequstedApprovedMaterialListFetched = true;
    _isLoading = true;

    notifyListeners();

    String userToken = SharedManager().getString(SharedEnum.userToken).toString();
    final result = await workSpaceService.getWorkSpaceApprovedRequirementMaterialsList(taskId, userToken);

    result.fold(
      (l) => {
        _woRequestedApprovedMaterialsList = l,
      },
      (r) => {},
    );

    _isLoading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _isRequstedApprovedMaterialListFetched = false;
    });
  }
}
