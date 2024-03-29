import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vm_fm_4/feature/models/reject_state_models/reject_state_model.dart';
import 'package:vm_fm_4/feature/models/work_order_models/delivered_spare_of_model.dart';
import 'package:vm_fm_4/feature/models/work_space/child_location_structure.dart';
import 'package:vm_fm_4/feature/models/work_space/main_location_structure.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_current_state.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_note.dart';

import '../../../../core/enums/task_node_enums.dart';
import '../../../../core/enums/task_response_enums.dart';
import '../../../../core/log/log_manager.dart';
import '../../../exceptions/custom_service_exceptions.dart';
import '../../../injection.dart';
import '../../../models/home_page_models/asset_list_model.dart';
import '../../../models/work_space/work_space_appendings.dart';
import '../../../models/work_space/work_space_detail.dart';
import '../../../models/work_space/work_space_documents.dart';
import '../../../models/work_space/work_space_efforts.dart';
import '../../../models/work_space/work_space_my_group_demand_list.dart';
import '../../../models/work_space/work_space_requested_materials_inventory.dart';
import '../../../models/work_space/work_space_requirement_materials_list.dart';
import '../../../models/work_space/work_space_spareparts.dart';
import '../../../models/work_space/work_space_user_inventory.dart';
import '../../service_manager.dart';

abstract class WorkSpaceServiceRepository {
  final Dio dio = Injection.getIt.get<ServiceManager>().dio;
  final logger = Injection.getIt.get<LogManager>().logger;

  Future<Either<List<WorkSpaceDetail>, CustomServiceException>> getMyWorkSpaces(String id, String token, int page, String language);

  Future<Either<WorkSpaceMyGroupDemandList, CustomServiceException>> getMyGroupDemandList(String token, String language);

  Future<Either<List<WorkSpacePendiks>, CustomServiceException>> getWorkSpacePendiks(String id, String token, int page, String language);

  Future<Either<WorkSpaceDetail, CustomServiceException>> getWorkSpaceWithSearch(String workOrderCode, String token);

  Future<Either<WorkSpaceDetail, CustomServiceException>> getWorkSpaceWithSearchFromGroupWorks(String workOrderCode, String token);

  Future<Either<List<WorkSpaceDetail>, CustomServiceException>> getWorkSpaceDetailsByRequestType(String requestId, int page, String token);

  Future<Either<List<WorkSpaceEfforts>, CustomServiceException>> getWorkSpaceEfforts(String taskId, String token);

  Future<Either<bool, CustomServiceException>> addWorkOrderEffort(
    String taskId,
    String token,
    String description,
    String duration,
    String startDate,
    String endDate,
    String effortType,
  );

  Future<Either<List<WorkSpaceSpareparts>, CustomServiceException>> getWorkSpaceSpareparts(String taskId, String token);

  Future<Either<WorkSpaceUserInventory, CustomServiceException>> getWorkSpaceUserInventory(String token);

  Future<Either<bool, CustomServiceException>> addWorkSpaceSpareparts(String taskId, String token, String sparePartId, String amount);

  Future<Either<List<WorkSpaceRequestedMaterialsInventory>, CustomServiceException>> getWorkSpaceRequestedMaterialsInventory(String token, int page);

  Future<Either<bool, CustomServiceException>> requestWorkSpaceMaterial(
    String workSpaceId,
    String taskId,
    String token,
    String subject,
    String description,
    String amount,
    String materialId,
  );

  Future<Either<bool, CustomServiceException>> takeItOnMe(String taskId, String currentStateId, String token);

  Future<Either<TaskResponseEnums, CustomServiceException>> changeWorkSpaceState(String taskId, String nextStateId, String token, String? groupId);

  Future<Either<List<WorkSpaceRequirementMaterialsList>, CustomServiceException>> getWorkSpaceRequirementMaterialsList(String taskId, String token);

  Future<Either<List<DeliveredSpareOfModel>, CustomServiceException>> getWorkSpaceApprovedRequirementMaterialsList(
    String taskId,
    String token,
  );

  Future<Either<bool, CustomServiceException>> saveDocumant(
    String filePath,
    String fileName,
    String description,
    String token,
    String taskId,
    String taskKey,
    String key,
  );

  Future<Either<WorkSpaceDetail, CustomServiceException>> getWorkSpaceByTaskId(String taskId, String token);

  Future<Either<List<WorkSpaceDocuments>, CustomServiceException>> getWorkSpaceDocuments(String token, String taskId);

  Future<Either<AssetListModel, CustomServiceException>> getAssetWithSearchTagNumber(String assetCode, String token);

  Future<Either<AssetListModel, CustomServiceException>> getAssetWithSearchIdentifier(String assetCode, String token);

  Future<bool> deleteNodeFromTask(String userToken, String taskId, String labelId, TaskNodeEnums labelType);

  Future<Either<List<WorkSpaceDetail>, CustomServiceException>> getGroupWorkOrders(String userToken, String language);

  Future<bool> addNoteToWorkOrder(String userToken, String taskId, String value);

  Future<List<WorkSpaceNote>> getWorkSpaceNotes(String taskId, String userToken);

  Future<Either<CurrentState, CustomServiceException>> getWorkSpaceStateGroups(String taskId, String workSpaceId, String token);

  Future<MainLocationStructure> getMainLocationStructure(String userToken);

  Future<List<ChildLocationStructure>> getChildLocationStructure(String userToken, String key, String label);

  Future<List<RejectStateModel>> getWorkSpaceRejectStateGroups(String taskId, String workSpaceId, String token);

  Future<Either<bool, CustomServiceException>> saveDocumentForMaintenance(
      String filePath, String fileName, String desc, String token, String id, String key, String isImage, String labels);
}
