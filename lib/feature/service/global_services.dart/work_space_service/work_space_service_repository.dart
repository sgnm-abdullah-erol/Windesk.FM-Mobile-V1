import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_user_inventory.dart';

import '../../../enums/task_response_enums.dart';
import '../../../exceptions/custom_service_exceptions.dart';
import '../../../injection.dart';
import '../../../log/log_manager.dart';
import '../../../models/work_space/work_space_appendings.dart';
import '../../../models/work_space/work_space_detail.dart';
import '../../../models/work_space/work_space_efforts.dart';
import '../../../models/work_space/work_space_my_group_demand_list.dart';
import '../../../models/work_space/work_space_requested_materials_inventory.dart';
import '../../../models/work_space/work_space_requirement_materials_list.dart';
import '../../../models/work_space/work_space_spareparts.dart';
import '../../service_manager.dart';

abstract class WorkSpaceServiceRepository {
  final Dio dio = Injection.getIt.get<ServiceManager>().dio;
  final logger = Injection.getIt.get<LogManager>().logger;

  Future<Either<List<WorkSpaceDetail>, CustomServiceException>> getMyWorkSpaces(String id, String token, int page);

  Future<Either<WorkSpaceMyGroupDemandList, CustomServiceException>> getMyGroupDemandList(String token);

  Future<Either<List<WorkSpacePendiks>, CustomServiceException>> getWorkSpacePendiks(String id, String token, int page);

  Future<Either<WorkSpaceDetail, CustomServiceException>> getWorkSpaceWithSearch(String workOrderCode, String token);

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

  Future<Either<TaskResponseEnums, CustomServiceException>> changeWorkSpaceState(String taskId, String nextStateId, String token);

  Future<Either<List<WorkSpaceRequirementMaterialsList>, CustomServiceException>> getWorkSpaceRequirementMaterialsList(String taskId, String token);

  Future<Either<List<WorkSpaceRequirementMaterialsList>, CustomServiceException>> getWorkSpaceApprovedRequirementMaterialsList(
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
}
