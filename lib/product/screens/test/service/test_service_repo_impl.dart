// ignore_for_file: unrelated_type_equality_checks

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vm_fm_4/core/constants/paths/service_tools.dart';
import 'package:vm_fm_4/product/screens/test/service/test_service_repo.dart';

import '../../../../core/enums/service_response_status_enums.dart';
import '../../../../core/enums/service_status_enums.dart';
import '../../../../feature/exceptions/custom_service_exceptions.dart';

class TestServiceRepositoryImpl extends TestServiceRepository {
  // TEST SERVICES
  @override
  Future<Either<bool, CustomServiceException>> accessTestWindesk() async {
    bool result = false;

    String url = '${ServiceTools.attachPath}?&timestamp=${DateTime.now().millisecondsSinceEpoch.toString()}';

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
  Future<Either<bool, CustomServiceException>> accessTestMobileService() async {
    bool result = false;

    String url = '${ServiceTools.baseUrlV2}/workorder/reactive';

    try {
      final response = await super.dio.get(url,
          options: Options(
            headers: {'xusercode': "sgnm1032", 'xtoken': ServiceTools.tokenV2},
            responseType: ResponseType.json,
          ));
      super.logger.e(response.toString());

      if (response.data[ServiceResponseStatusEnums.result.rawText] == ServiceStatusEnums.success.rawText) {
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
}
