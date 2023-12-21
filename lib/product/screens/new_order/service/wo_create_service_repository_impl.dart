import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_default_ws_user.dart';

import '../../../../core/constants/paths/service_tools.dart';
import '../../../../feature/exceptions/custom_service_exceptions.dart';
import '../../../../feature/models/wo_create_model/wo_create_component_model.dart';
import '../../../../feature/models/wo_create_model/wo_create_leaf_model.dart';
import '../../../../feature/models/wo_create_model/wo_create_location_model.dart';
import '../../../../feature/models/wo_create_model/wo_create_requestedby_model.dart';
import '../../../../feature/models/wo_create_model/wo_create_requestedtype_model.dart';
import '../../../../feature/models/wo_create_model/wo_create_type_model.dart';
import 'wo_create_service_repository.dart';

class WoCreateServiceRepositoryImpl extends WoCreateServiceRepository {
  @override
  Future<Either<WoCreateLocationModel, CustomServiceException>> getLocation(token) async {
    WoCreateLocationModel woCreateLocationModel;
    String url = '${ServiceTools.url.facility_url}/structures';

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

  @override
  Future<Either<WoCreateLeafModel, CustomServiceException>> getLazyLoading(token, key) async {
    WoCreateLeafModel woCreateLeafModel;
    String url = '${ServiceTools.url.facility_url}/jointspaces/lazyLoadingByKey';
    final response = await super.dio.post(
          url,
          data: {"key": key, "leafType": "", "rootLabels": [], "childrenLabels": []},
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
  Future<Either<List<WoCreateRequestedByModel>, CustomServiceException>> getRequestedBy(token) async {
    List<WoCreateRequestedByModel> woCreateRequestedByModel = [];

    String url = '${ServiceTools.url.users_url}/user?page=1&limit=100';
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

      woCreateRequestedByModel = WoCreateRequestedByModel.fromJsonList(response.data['users']);
      super.logger.e(woCreateRequestedByModel);
      return Left(woCreateRequestedByModel);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<List<WoCreateTypeModel>, CustomServiceException>> getType(token) async {
    List<WoCreateTypeModel> woCreateTypeModel = [];

    String url = '${ServiceTools.url.workorder_url}/task/task/find/task/types/related/with/workspace/707?page=1&limit=100&orderBy=undefined';
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
  Future<Either<List<WoCreateRequestedTypeModel>, CustomServiceException>> getRequestedType(token) async {
    List<WoCreateRequestedTypeModel> woCreateRequestedTypeModel = [];

    String url = '${ServiceTools.url.workorder_url}/classification/getAClassificationByRealmAndLabelNameAndLanguage/info';
    final response = await super.dio.post(
          url,
          data: {
            "label": ["RequestType"],
          },
          options: Options(
            headers: {'authorization': 'Bearer $token'},
          ),
        );

    woCreateRequestedTypeModel = WoCreateRequestedTypeModel.fromJsonList(response.data['root']['children'][0]['children']);
    super.logger.e(woCreateRequestedTypeModel);
    return Left(woCreateRequestedTypeModel);
  }

  @override
  Future<Either<List<WoCreateRequestedTypeModel>, CustomServiceException>> getCategory(token) async {
    List<WoCreateRequestedTypeModel> woCreateLocationModel = [];

    String url = '${ServiceTools.url.workorder_url}/classification/getAClassificationByRealmAndLabelNameAndLanguage/info';
    final response = await super.dio.post(
          url,
          data: {
            "label": ["WoCategory"],
          },
          options: Options(
            headers: {'authorization': 'Bearer $token'},
          ),
        );

    woCreateLocationModel = WoCreateRequestedTypeModel.fromJsonList(response.data['root']['children'][0]['children']);
    super.logger.e(woCreateLocationModel);
    return Left(woCreateLocationModel);
  }

  @override
  Future<Either<List<WoCreateComponentModel>, CustomServiceException>> getComponents(token) async {
    List<WoCreateComponentModel> woCreatecomponentModel = [];

    String url = '${ServiceTools.url.asset_url}/component/search/?page=1&limit=100&orderBy=DESC&orderByColumn=&searchString=';
    final response = await super.dio.get(
          url,
          options: Options(
            headers: {'authorization': 'Bearer $token'},
          ),
        );

    woCreatecomponentModel = WoCreateComponentModel.fromJsonList(response.data['children']);
    super.logger.e(woCreatecomponentModel);
    return Left(woCreatecomponentModel);
  }

  @override
  Future<Either<dynamic, CustomServiceException>> createTask(token, summary, requestType, requestedBy, description, appointmendData, templatedBy,
      requestSpaceId, requestSpaceLabels, woCategory, woComponent) async {
    String url = '${ServiceTools.url.workorder_url}/task';

    try {
      final response = await super.dio.post(
            url,
            data: {
              "name": summary,
              "requestType": requestType,
              "requestedBy": [requestedBy],
              "description": description,
              "appointmentDate": appointmendData,
              "templatedBy": ['Fault001'],
              //"requestedComponents": [woComponent],
              "requestedSpaces": [
                {
                  "id": requestSpaceId,
                  "labels": [requestSpaceLabels]
                }
              ],
              "woCategory": woCategory,
              "isMobile": true,
              "depended_on": ["718"]
            },
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );
      final data = response.data;
      super.logger.e(data);
      return Left(data);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<dynamic, CustomServiceException>> updateTask(
      String token, String taskId, String requestedId, String requestedLabel, String templatedBy, String depended) async {
    String url = '${ServiceTools.url.workorder_url}/task';

    try {
      final response = await super.dio.patch(
            url,
            data: [
              {
                "label": ["Task"],
                "identifier": taskId,
                "variableName": "requestedSpaces",
                "value": [
                  {
                    "id": requestedId,
                    "labels": [requestedLabel]
                  }
                ]
              },
              {
                "label": ["Task"],
                "identifier": taskId,
                "variableName": "templatedBy",
                "value": [templatedBy]
              },
              {
                "label": ["Task"],
                "identifier": taskId,
                "variableName": "depended_on",
                "value": [depended]
              }
            ],
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      final data = response.data;
      super.logger.e(data);
      return Left(data);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<WoCreateDefaultWsUser, CustomServiceException>> getDefaultWorkSpaceOfUser(token, userKey) async {
    WoCreateDefaultWsUser woCreateDefaultWsUser;
    String url = '${ServiceTools.url.workorder_url}/workspace/getDefaultWorkSpaceOfUser/$userKey';

    try {
    
    final response = await super.dio.get(
          url,
          options: Options(
            headers: {'authorization': 'Bearer $token'},
          ),
        );
    final data = response.data;
    woCreateDefaultWsUser = WoCreateDefaultWsUser.fromJson(data);
    super.logger.e(woCreateDefaultWsUser);
    return Left(woCreateDefaultWsUser);
  
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.tokenChangeError, statusCode: '400'));
    }
  }
}
