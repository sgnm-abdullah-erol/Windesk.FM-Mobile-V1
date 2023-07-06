import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vm_fm_4/feature/injection.dart';
import 'package:vm_fm_4/feature/log/log_manager.dart';
import 'package:vm_fm_4/feature/models/work_order_models/work_order_attachments.dart';
import 'package:vm_fm_4/feature/models/work_order_models/work_order_loads.dart';
import 'package:vm_fm_4/feature/service/service_manager.dart';

import '../../../exceptions/custom_service_exceptions.dart';

abstract class WorkOrderServiceRepository {
  final Dio dio = Injection.getIt.get<ServiceManager>().dio;
  final logger = Injection.getIt.get<LogManager>().logger;

  Future<Either<List<WorkOrderLoads>, CustomServiceException>> getWorkOrderLoads(String workOrderCode);

  Future<Either<List<WorkOrderAttachments>, CustomServiceException>> getWorkOrderAttachments(String workOrderCode);
}
