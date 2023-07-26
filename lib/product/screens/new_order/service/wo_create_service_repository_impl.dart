import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vm_fm_4/feature/exceptions/custom_service_exceptions.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_location_model.dart';
import 'package:vm_fm_4/product/screens/new_order/service/wo_create_service_repository.dart';

class WoCreateServiceRepositoryImpl extends WoCreateServiceRepository {
  @override
  Future<Either<WoCreateLocationModel, CustomServiceException>> getLocation(token) async {
    WoCreateLocationModel woCreateLocationModel;
    String url = 'http://localhost:3010/structures';

    try {
      final response = await super.dio.get(
            url,
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      final data = response.data;
      woCreateLocationModel = WoCreateLocationModel.fromJson(data);

      return Left(woCreateLocationModel);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }
}
