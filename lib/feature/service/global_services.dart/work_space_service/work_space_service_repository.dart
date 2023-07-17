import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vm_fm_4/feature/exceptions/custom_service_exceptions.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_appendings.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_detail.dart';

import '../../../injection.dart';
import '../../../log/log_manager.dart';
import '../../../models/work_space/work_space_my_group_demand_list.dart';
import '../../service_manager.dart';

abstract class WorkSpaceServiceRepository {
  final Dio dio = Injection.getIt.get<ServiceManager>().dio;
  final logger = Injection.getIt.get<LogManager>().logger;

  Future<Either<List<WorkSpaceDetail>, CustomServiceException>> getMyWorkSpaces(String id, String token, int page);

  Future<Either<WorkSpaceMyGroupDemandList, CustomServiceException>> getMyGroupDemandList(String token);

  Future<Either<List<WorkSpacePendiks>, CustomServiceException>> getWorkSpacePendiks(String id, String token, int page);
}
