import 'package:flutter/cupertino.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_requested_materials.dart';

import '../../../../../../feature/database/shared_manager.dart';
import '../../../../../../feature/enums/shared_enums.dart';
import '../../../../../../feature/injection.dart';
import '../../../../../../feature/models/work_space/work_space_efforts.dart';
import '../../../../../../feature/models/work_space/work_space_spareparts.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

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

  List<WorkSpaceRequestedMaterials> _woRequestedMaterials = [];
  List<WorkSpaceRequestedMaterials> get woRequestedMaterials => _woRequestedMaterials;

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

  void fetchRequestedMaterials() async {
    _isLoading = true;
    _isRequestedListFetched = true;
    notifyListeners();

    String userToken = await SharedManager().getString(SharedEnum.userToken);
    final result = await workSpaceService.getWorkSpaceRequestedMaterials(userToken, 1);

    result.fold(
      (l) => {
        _woRequestedMaterials = l,
      },
      (r) => {
        _isRequestedListFetched = false,
      },
    );

    _isLoading = false;
    notifyListeners();
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
