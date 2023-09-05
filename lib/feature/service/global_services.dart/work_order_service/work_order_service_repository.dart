import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../exceptions/custom_service_exceptions.dart';
import '../../../injection.dart';
import '../../../../core/log/log_manager.dart';
import '../../../models/work_order_models/work_order_added_resources_model.dart';
import '../../../models/work_order_models/work_order_attachments_model.dart';
import '../../../models/work_order_models/work_order_date_action_model.dart';
import '../../../models/work_order_models/work_order_details_model.dart';
import '../../../models/work_order_models/work_order_loads_model.dart';
import '../../../models/work_order_models/work_order_resources_model.dart';
import '../../../models/work_order_models/work_order_shiftings_model.dart';
import '../../../models/work_order_models/work_order_spareparts_model.dart';
import '../../../models/work_order_models/work_order_stores_model.dart';
import '../../service_manager.dart';

abstract class WorkOrderServiceRepository {
  final Dio dio = Injection.getIt.get<ServiceManager>().dio;
  final logger = Injection.getIt.get<LogManager>().logger;

  // GET WORK ORDER METHODS
  Future<Either<List<WorkOrderLoadsModel>, CustomServiceException>> getWorkOrderLoads(String workOrderCode);

  Future<Either<List<WorkOrderAttachmentsModel>, CustomServiceException>> getWorkOrderAttachments(String workOrderCode);

  Future<Either<List<WorkOrderResourcesModel>, CustomServiceException>> getWorkOrderResources(String workOrderCode);

  Future<Either<List<WorkOrderShiftingsModel>, CustomServiceException>> getWorkOrderShiftings();

  Future<Either<WorkOrderDetailsModel, CustomServiceException>> getWorkOrderDetails(String workOrderCode);

  Future<Either<List<WorkOrderSparepartsModel>, CustomServiceException>> getWorkOrderSpareparts(String workOrderCode);

  Future<Either<WorkOrderDateActionModel, CustomServiceException>> getWorkOrderDateAction(String workOrderCode, String actionType);

  Future<Either<List<WorkOrderStores>, CustomServiceException>> getWorkOrderStores();

  Future<Either<List<WorkOrderAddedResources>, CustomServiceException>> getWorkOrderAddedResources(String serviceCode);

  // ADD WORK ORDER METHODS
  Future<Either<bool, CustomServiceException>> addWorkOrderEffort(String workOrderCode, String workPeriod);

  Future<Either<bool, CustomServiceException>> addWorkOrderPersonal(String workOrderCode, String moduleCode, String tuwnofWork);

  Future<Either<bool, CustomServiceException>> addWorkOrderImage(String workOrderCode, String image, String desc);

  Future<Either<bool, CustomServiceException>> addWorkOrderSpareparts(String workOrderCode, String product, String amount, String unit);

  // DELETE WORK ORDER METHODS
  Future<Either<bool, CustomServiceException>> deleteWorkOrderSpareparts(String workOrderCode);

  Future<Either<bool, CustomServiceException>> deleteWorkOrderPersonal(String workOrderCode, String moduleCode);

  Future<Either<bool, CustomServiceException>> deleteWorkOrderEffort(String workOrderCode);
}
