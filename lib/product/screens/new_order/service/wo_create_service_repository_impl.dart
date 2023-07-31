import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vm_fm_4/feature/exceptions/custom_service_exceptions.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_leaf_model.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_location_model.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_requestedby_model.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_type_model.dart';
import 'package:vm_fm_4/product/screens/new_order/service/wo_create_service_repository.dart';

class WoCreateServiceRepositoryImpl extends WoCreateServiceRepository {
  @override
  Future<Either<WoCreateLocationModel, CustomServiceException>> getLocation(
      token) async {
    WoCreateLocationModel woCreateLocationModel;
    String url = 'http://10.0.2.2:3010/structures';

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
      return Right(CustomServiceException(
          message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<WoCreateLeafModel, CustomServiceException>> getLazyLoading(
      token, key) async {
    WoCreateLeafModel woCreateLeafModel;
    String url = 'http://10.0.2.2:3010/jointspaces/lazyLoadingByKey';
    final response = await super.dio.post(
          url,
          data: {
            "key": key,
            "leafType": "",
            "rootLabels": [],
            "childrenLabels": []
          },
          options: Options(
            headers: {'authorization': 'Bearer $token'},
          ),
        );
    final data = response.data;
    woCreateLeafModel = WoCreateLeafModel.fromJson(data);
    super.logger.e(woCreateLeafModel);
    return Left(woCreateLeafModel);
  }

  @override
  Future<Either<List<WoCreateRequestedByModel>, CustomServiceException>>
      getRequestedBy(token) async {
    List<WoCreateRequestedByModel> woCreateRequestedByModel = [];

    String url = 'http://10.0.2.2:3012/user?page=1&limit=100';
    try {
      final response = await super.dio.get(
            url,
            data: {
              "label": ["RequestType"],
            },
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      woCreateRequestedByModel =
          WoCreateRequestedByModel.fromJsonList(response.data['users']);
      super.logger.e(woCreateRequestedByModel);
      return Left(woCreateRequestedByModel);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(
          message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<List<WoCreateTypeModel>, CustomServiceException>> getType(
      token) async {
    List<WoCreateTypeModel> woCreateTypeModel = [];

    String url =
        'http://10.0.2.2:3015/task/task/find/task/types/related/with/workspace/493?page=1&limit=100';
    final response = await super.dio.get(
          url,
          options: Options(
            headers: {'authorization': 'Bearer $token'},
          ),
        );

    woCreateTypeModel = WoCreateTypeModel.fromJsonList(response.data);
    super.logger.e(woCreateTypeModel);
    return Left(woCreateTypeModel);
  }

  @override
  Future<Either<List<WoCreateTypeModel>, CustomServiceException>>
      getRequestedType(token) async {
    List<WoCreateTypeModel> woCreateTypeModel = [];

    String url =
        'http://10.0.2.2:3015/classification/getAClassificationByRealmAndLabelNameAndLanguage/info';
    final response = await super.dio.post(
          url,
          data: {
            "label": ["RequestType"],
          },
          options: Options(
            headers: {'authorization': 'Bearer $token'},
          ),
        );

    super.logger.e(response.data['root']['children'][0]['children']);
    //woCreateTypeModel = WoCreateTypeModel.fromJsonList(response.data);
    return Left(woCreateTypeModel);
  }
}
