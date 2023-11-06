// ignore_for_file: prefer_final_fields, use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:vm_fm_4/core/enums/task_node_enums.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_detail.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_documents.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

import '../../../../../../core/database/shared_manager.dart';
import '../../../../../../core/enums/shared_enums.dart';
import '../../../../../../feature/injection.dart';
import '../../../../../../feature/models/work_space/work_space_efforts.dart';
import '../../../../../../feature/models/work_space/work_space_note.dart';
import '../../../../../../feature/models/work_space/work_space_requirement_materials_list.dart';
import '../../../../../../feature/models/work_space/work_space_spareparts.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

class WorkOrderDetailServiceProvider extends ChangeNotifier {
  final WorkSpaceServiceRepositoryImpl workSpaceService = Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();
  final WorkSpaceDetail detail;
  WorkOrderDetailServiceProvider({required this.detail});

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

  bool _isNotesFetched = false;
  bool get isNotesFetched => _isNotesFetched;

  List<WorkSpaceEfforts>? _woEffortList;
  List<WorkSpaceEfforts>? get woEffortList => _woEffortList;

  List<WorkSpaceSpareparts>? _woSpareparts;
  List<WorkSpaceSpareparts>? get woSpareparts => _woSpareparts;

  List<WorkSpaceRequirementMaterialsList> _woRequestedMaterialsList = [];
  List<WorkSpaceRequirementMaterialsList> get woRequestedMaterialsList => _woRequestedMaterialsList;

  List<WorkSpaceRequirementMaterialsList> _woRequestedApprovedMaterialsList = [];
  List<WorkSpaceRequirementMaterialsList> get woRequestedApprovedMaterialsList => _woRequestedApprovedMaterialsList;

  List<WorkSpaceDocuments> _workSpaceDocuments = [];
  List<WorkSpaceDocuments> get workSpaceDocuments => _workSpaceDocuments;

  List<WorkSpaceNote> _workSpaceNotes = [];
  List<WorkSpaceNote> get workSpaceNotes => _workSpaceNotes;

  void deleteNode(BuildContext context, String labelId, String taskId, TaskNodeEnums labelType) async {
    String userToken = await SharedManager().getString(SharedEnum.userToken);

    final response = await workSpaceService.deleteNodeFromTask(userToken, taskId, labelId, labelType);

    if (response == true) {
      if (labelType.variableName == 'effort') {
        fetchEfforts(taskId, detail.state?.nextStates?.first.id.toString() ?? '');
        snackBar(context, LocaleKeys.DeleteEffort.tr(), 'success');
      } else if (labelType.variableName == 'usedSpareOf') {
        fetchSpareparts(taskId);
        snackBar(context, LocaleKeys.DeleteMaterial.tr(), 'success');
      } else if (labelType.variableName == 'attachedDocuments') {
        fetchDocumants(taskId);
        snackBar(context, LocaleKeys.DeleteDocument.tr(), 'success');
      } else if (labelType.variableName == 'note') {
        fetchNotes(taskId);
        snackBar(context, LocaleKeys.DeleteNote.tr(), 'success');
      }
    } else if (response == false) {
      snackBar(context, LocaleKeys.DeleteError.tr(), 'error');
    }
  }

  void update() {
    notifyListeners();
  }

  void fetchNotes(String taskId) async {
    _isLoading = true;
    _isNotesFetched = true;
    notifyListeners();

    String userToken = await SharedManager().getString(SharedEnum.userToken);
    final response = await workSpaceService.getWorkSpaceNotes(taskId, userToken);

    if (response.isEmpty) {
      _workSpaceNotes = [];
    } else {
      _workSpaceNotes = response;
    }

    _isLoading = false;
    _isNotesFetched = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _isNotesFetched = false;
    });
  }

  void fetchDocumants(String taskID) async {
    _isLoading = true;
    _isDocumantListFetched = true;
    notifyListeners();

    String userToken = await SharedManager().getString(SharedEnum.userToken);
    final result = await workSpaceService.getWorkSpaceDocuments(userToken, taskID);

    result.fold(
      (l) => {
        _workSpaceDocuments = l,
        _isDocumantListFetched = true,
      },
      (r) => {
        _isDocumantListFetched = false,
      },
    );

    _isLoading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _isDocumantListFetched = false;
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

    String userToken = await SharedManager().getString(SharedEnum.userToken);

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

    String userToken = await SharedManager().getString(SharedEnum.userToken);
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
