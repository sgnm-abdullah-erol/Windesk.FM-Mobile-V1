import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vm_fm_4/feature/enums/service_response_status.dart';
import 'package:vm_fm_4/feature/enums/service_status_enums.dart';
import 'package:vm_fm_4/feature/exceptions/custom_service_exceptions.dart';
import 'package:vm_fm_4/feature/models/work_order_models/work_order_attachments.dart';
import 'package:vm_fm_4/feature/models/work_order_models/work_order_loads.dart';
import 'package:vm_fm_4/feature/service/global_services.dart/work_order_service/work_order_service_repository.dart';

class WorkOrderServiceRepositoryImpl extends WorkOrderServiceRepository {
  @override
  Future<Either<List<WorkOrderLoads>, CustomServiceException>> getWorkOrderLoads(String workOrderCode) async {
    List<WorkOrderLoads> loads = [];
    String url = 'http://windeskmobile.signumtte.com/workorder/$workOrderCode/workloads';

    try {
      final response = await super.dio.get(url,
          options: Options(
            headers: {
              'xusercode': "sgnm1040",
              'xtoken': 'demo!',
            },
            responseType: ResponseType.json,
          ));

      if (response.data[ServiceResponseStatus.result.rawText] == ServiceStatusEnums.success.rawText) {
        final data = response.data['records'];
        loads = const WorkOrderLoads().fromJsonList(data);

        return Left(loads);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.noInternetConnection, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.noInternetConnection, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkOrderAttachments>, CustomServiceException>> getWorkOrderAttachments(String workOrderCode) {
    // TODO: implement getWorkOrderAttachments
    throw UnimplementedError();
  }
}
