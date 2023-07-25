import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_user_inventory.dart';

import '../../../exceptions/custom_service_exceptions.dart';
import '../../../injection.dart';
import '../../../log/log_manager.dart';
import '../../../models/work_space/work_space_appendings.dart';
import '../../../models/work_space/work_space_detail.dart';
import '../../../models/work_space/work_space_efforts.dart';
import '../../../models/work_space/work_space_my_group_demand_list.dart';
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
}
