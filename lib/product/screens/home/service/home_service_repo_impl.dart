// ignore_for_file: unrelated_type_equality_checks

import 'package:dartz/dartz.dart';
import 'package:vm_fm_4/feature/constants/paths/service_tools.dart';
import 'package:vm_fm_4/feature/database/shared_manager.dart';
import 'package:vm_fm_4/feature/enums/shared_enums.dart';

import '../../../../feature/enums/service_status_enums.dart';
import '../../../../feature/exceptions/custom_service_exceptions.dart';
import 'home_service_repo.dart';

class HomeServiceRepositoryImpl extends HomeServiceRepository {
  // TEST SERVICES
  @override
  Future<Either<bool, CustomServiceException>> logout() async {
    bool result = false;
    String deviceToken = await SharedManager().getString(SharedEnum.deviceId);

    String url = '${ServiceTools.baseUrlV1}${ServiceTools.tokenV1}$deviceToken&action=logout&username=';

    try {
      final response = await super.dio.get(url);
      super.logger.e(response.toString());

      if (response.statusCode.toString() == ServiceStatusEnums.resultCode) {
        result = true;

        super.logger.e(result.toString());

        return Left(result);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddEffortError, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderAddEffortError, statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> accessTestMobileService() {
    // TODO: implement accessTestMobileService
    throw UnimplementedError();
  }
}
