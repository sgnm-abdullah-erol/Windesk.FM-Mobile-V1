import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_default_ws_user.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_work_space_model.dart';

import '../../../../core/log/log_manager.dart';
import '../../../../feature/exceptions/custom_service_exceptions.dart';
import '../../../../feature/injection.dart';
import '../../../../feature/models/wo_create_model/wo_create_component_model.dart';
import '../../../../feature/models/wo_create_model/wo_create_leaf_model.dart';
import '../../../../feature/models/wo_create_model/wo_create_location_model.dart';
import '../../../../feature/models/wo_create_model/wo_create_requestedby_model.dart';
import '../../../../feature/models/wo_create_model/wo_create_requestedtype_model.dart';
import '../../../../feature/models/wo_create_model/wo_create_type_model.dart';
import '../../../../feature/service/service_manager.dart';

abstract class WoCreateServiceRepository {
  final Dio dio = Injection.getIt.get<ServiceManager>().dio;
  final logger = Injection.getIt.get<LogManager>().logger;

  Future<Either<WoCreateLocationModel, CustomServiceException>> getLocation(String token);
  Future<Either<WoCreateLeafModel, CustomServiceException>> getLazyLoading(String token, String key);
  Future<Either<List<WoCreateRequestedByModel>, CustomServiceException>> getRequestedBy(String token);
  Future<Either<List<WoCreateTypeModel>, CustomServiceException>> getType(String token);
  Future<Either<List<WoCreateRequestedTypeModel>, CustomServiceException>> getRequestedType(String token);
  Future<Either<List<WoCreateRequestedTypeModel>, CustomServiceException>> getCategory(String token);
  Future<Either<List<WoCreateComponentModel>, CustomServiceException>> getComponents(String token);
  Future<Either<dynamic, CustomServiceException>> createTask(String token, String summary, String requestType, String requestedBy, String description,
      String appointmendData, String templatedBy, String requestSpaceId, String requestSpaceLabels, String woCategory, String woComponent);
  Future<Either<dynamic, CustomServiceException>> updateTask(String token,String taskId,String requestedId,String requestedLabel, String templatedBy, String depended);
  Future<Either<WoCreateDefaultWsUser, CustomServiceException>> getDefaultWorkSpaceOfUser(String token, String userKey);
  Future<Either<WoCreateWorkSpaceModel, CustomServiceException>> getWorkFlows(String token, String workSpaceId);

}
