import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vm_fm_4/feature/exceptions/custom_service_exceptions.dart';
import 'package:vm_fm_4/feature/injection.dart';
import 'package:vm_fm_4/feature/log/log_manager.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_component_model.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_leaf_model.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_location_model.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_requestedby_model.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_requestedtype_model.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_type_model.dart';
import 'package:vm_fm_4/feature/service/service_manager.dart';

abstract class WoCreateServiceRepository {
  final Dio dio = Injection.getIt.get<ServiceManager>().dio;
  final logger = Injection.getIt.get<LogManager>().logger;

    Future<Either<WoCreateLocationModel, CustomServiceException>>  getLocation(String token);
    Future<Either<WoCreateLeafModel, CustomServiceException>>  getLazyLoading(String token, String key);
    Future<Either<List<WoCreateRequestedByModel>, CustomServiceException>>  getRequestedBy(String token);
    Future<Either<List<WoCreateTypeModel>, CustomServiceException>>  getType(String token);
    Future<Either<List<WoCreateRequestedTypeModel>, CustomServiceException>> getRequestedType(String token);
    Future<Either<List<WoCreateRequestedTypeModel>, CustomServiceException>> getCategory(String token);
    Future<Either<List<WoCreateComponentModel>, CustomServiceException>> getComponents(String token);
    Future<Either<dynamic, CustomServiceException>> createTask(String token, String summary, String requestType, String requestedBy, String description, String appointmendData, String templatedBy, String requestSpaceId,String requestSpaceLabels, String woCategory, String woComponent);



}