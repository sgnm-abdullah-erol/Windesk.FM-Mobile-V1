import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import '../../../models/home_page_models/asset_list_model.dart';
import '../../../constants/paths/service_tools.dart';
import '../../../models/work_space/work_space_documents.dart';
import '../../../models/work_space/work_space_requirement_materials_list.dart';

import '../../../enums/task_response_enums.dart';
import '../../../exceptions/custom_service_exceptions.dart';
import '../../../models/work_space/work_space_appendings.dart';
import '../../../models/work_space/work_space_detail.dart';
import '../../../models/work_space/work_space_efforts.dart';
import '../../../models/work_space/work_space_my_group_demand_list.dart';
import '../../../models/work_space/work_space_requested_materials_inventory.dart';
import '../../../models/work_space/work_space_spareparts.dart';
import '../../../models/work_space/work_space_user_inventory.dart';
import 'work_space_service_repository.dart';

class WorkSpaceServiceRepositoryImpl extends WorkSpaceServiceRepository {
  @override
  Future<Either<List<WorkSpaceDetail>, CustomServiceException>> getMyWorkSpaces(
      String id, String token, int page) async {
    List<WorkSpaceDetail> workSpaceDetailList = [];

    String url =
        '${ServiceTools.url.workorder_url}/task/workSpace/task/state/List/for/assigned/user/pagination/swagger?page=$page&limit=10&orderBy=DESC&orderByColumn%5B0%5D=updatedAt';
    final response = await super.dio.get(
          url,
          options: Options(
            headers: {'authorization': 'Bearer $token'},
          ),
        );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;
      workSpaceDetailList = WorkSpaceDetail.fromJsonList(data);

      return Left(workSpaceDetailList);
    } else {
      return Right(CustomServiceException(
          message: CustomServiceMessages.work,
          statusCode: response.statusCode.toString()));
    }
  }

  @override
  Future<Either<WorkSpaceMyGroupDemandList, CustomServiceException>>
      getMyGroupDemandList(String token) async {
    WorkSpaceMyGroupDemandList workSpaceMyGroupDemandList;

    String url =
        '${ServiceTools.url.workorder_url}/classification/getRequestTypeWithTaskCount';

    try {
      final response = await super.dio.post(
            url,
            options: Options(
              headers: {'authorization': 'Bearer $token'},
              responseType: ResponseType.json,
            ),
          );
      super.logger.i(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        workSpaceMyGroupDemandList = WorkSpaceMyGroupDemandList.fromJson(data);

        return Left(workSpaceMyGroupDemandList);
      } else {
        super.logger.e(response.statusCode);
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkSpacePendiks>, CustomServiceException>>
      getWorkSpacePendiks(String id, String token, int page) async {
    List<WorkSpacePendiks> workSpaceAppendings = [];
    String url =
        '${ServiceTools.url.workorder_url}/task/workSpace/task/state/List/can/be/approve/current/user/pagination/$id';

    try {
      final response = await super.dio.get(
            url,
            data: {
              "page": page,
              "limit": 10,
            },
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        workSpaceAppendings = WorkSpacePendiks.fromJsonList(data);
        return Left(workSpaceAppendings);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }

  @override
  Future<Either<WorkSpaceDetail, CustomServiceException>>
      getWorkSpaceWithSearch(String workOrderCode, String token) async {
    List<WorkSpaceDetail> workSpaceDetailList;
    String url =
        '${ServiceTools.url.workorder_url}/task/workSpace/task/state/List/for/assigned/user/pagination/swagger/search?&searchString=$workOrderCode';
    try {
      final response = await super.dio.get(
            url,
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        workSpaceDetailList = WorkSpaceDetail.fromJsonList(data);

        return Left(workSpaceDetailList.first);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }

  @override
  Future<Either<AssetListModel, CustomServiceException>> getAssetWithSearch(
      String assetCode, String token) async {
    AssetListModel assetListModel;
    String url =
        '${ServiceTools.url.asset_url}/component/searchByColumn/?page=1&limit=10&orderBy=ASC&orderByColumn=&searchColumn=tagNumber&searchString=$assetCode&searchType=CONTAINS';
    try {
      final response = await super.dio.get(
            url,
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      final data = response.data['children'][0];
      assetListModel = AssetListModel.fromJson(data);

      return Left(assetListModel);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkSpaceDetail>, CustomServiceException>>
      getWorkSpaceDetailsByRequestType(
          String requestId, int page, String token) async {
    List<WorkSpaceDetail> workSpaceDetailList = [];
    String url =
        '${ServiceTools.url.workorder_url}/task/mobile/getTasksByRequestType/swagger/$requestId?page=$page&limit=999&orderBy=DESC&orderByColumn=updateAt';
    try {
      final response = await super.dio.get(
            url,
            data: {},
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        workSpaceDetailList = WorkSpaceDetail.fromJsonList(data);
        return Left(workSpaceDetailList);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkSpaceEfforts>, CustomServiceException>>
      getWorkSpaceEfforts(String taskId, String token) async {
    List<WorkSpaceEfforts> workSpaceEfforts;
    String url =
        '${ServiceTools.url.workorder_url}/task/mobile/getEffortsByTaskId/$taskId';

    try {
      final response = await super.dio.get(
            url,
            data: {},
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        workSpaceEfforts = WorkSpaceEfforts.fromJsonList(data);

        return Left(workSpaceEfforts);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> addWorkOrderEffort(
    String taskId,
    String token,
    String description,
    String duration,
    String startDate,
    String endDate,
    String effortType,
  ) async {
    bool result;
    String url = '${ServiceTools.url.workorder_url}/task/add/node/to/task';

    if (effortType == 'Working') {
      effortType = 'EffortType2';
    } else if (effortType == 'Way') {
      effortType = 'EffortType1';
    }
    try {
      final response = await super.dio.post(
            url,
            data: [
              {
                "label": ["Task"],
                "identifier": taskId,
                "variableName": "effort",
                "value": [
                  {
                    "startDate": startDate,
                    "endDate": endDate,
                    "effortDuration": duration,
                    "effortType": effortType,
                    "description": description,
                  }
                ]
              }
            ],
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      final data = response.data;

      if (data == 'added') {
        result = true;
      } else {
        result = false;
      }

      return Left(result);
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkSpaceSpareparts>, CustomServiceException>>
      getWorkSpaceSpareparts(String taskId, String token) async {
    List<WorkSpaceSpareparts> workSpaceSpareparts;
    String url =
        '${ServiceTools.url.workorder_url}/task/mobile/getSparesByTaskId/$taskId';

    try {
      final response = await super.dio.get(
            url,
            data: {},
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        workSpaceSpareparts = WorkSpaceSpareparts.fromJsonList(data);

        return Left(workSpaceSpareparts);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }

  @override
  Future<Either<WorkSpaceUserInventory, CustomServiceException>>
      getWorkSpaceUserInventory(String token) async {
    WorkSpaceUserInventory workSpaceUserInventory;
    String url = '${ServiceTools.url.users_url}/inventory/userInventory';

    try {
      final response = await super.dio.get(
            url,
            data: {},
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        workSpaceUserInventory = WorkSpaceUserInventory.fromJson(data);

        return Left(workSpaceUserInventory);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> addWorkSpaceSpareparts(
      String taskId, String token, String sparePartId, String amount) async {
    bool result;
    String url = '${ServiceTools.url.workorder_url}/task/add/node/to/task';

    try {
      final response = await super.dio.post(
            url,
            data: [
              {
                "label": ["Task"],
                "identifier": taskId,
                "variableName": "usedSpareOf",
                "value": [
                  {
                    "id": sparePartId,
                    "amount": amount,
                  }
                ]
              }
            ],
            options: Options(
              headers: {'authorization': 'Bearer $token'},
              contentType: Headers.jsonContentType,
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

        if (data == 'added') {
          result = true;
        } else {
          result = false;
        }

        return Left(result);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }

  @override
  Future<
      Either<List<WorkSpaceRequestedMaterialsInventory>,
          CustomServiceException>> getWorkSpaceRequestedMaterialsInventory(
    String token,
    int page,
  ) async {
    List<WorkSpaceRequestedMaterialsInventory> workSpaceRequestedMaterials;
    String url =
        '${ServiceTools.url.asset_url}/types/getMobileAllTypesWithMeasurementUnitAndAmount?page=$page&limit=10&orderBy=ASC&orderByColumn=name&superSet=Spare';
    try {
      final response = await super.dio.get(
            url,
            data: {},
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        workSpaceRequestedMaterials =
            WorkSpaceRequestedMaterialsInventory.fromJsonList(data) ?? [];

        return Left(workSpaceRequestedMaterials);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> requestWorkSpaceMaterial(
    String workSpaceId,
    String taskId,
    String token,
    String subject,
    String description,
    String amount,
    String materialId,
  ) async {
    bool result;
    String url = '${ServiceTools.url.workorder_url}/task';

    try {
      final response = await super.dio.post(
            url,
            data: {
              "idLabel": {
                "label": ["WorkSpace"],
                "identifier": workSpaceId // workspace id
              },
              "tag": ["depo"],
              "name": subject,
              "description": description,
              "originiatedBy": taskId, // task id
              "templatedBy": ["MaterialRequest001"],
              "requestedSpareOf": [
                {
                  "id": materialId, // malzeme id
                  "amount": amount, // amount
                  "label": ["Spare"]
                }
              ]
            },
            options: Options(
              headers: {'authorization': 'Bearer $token'},
              contentType: Headers.jsonContentType,
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        result = true;

        return Left(result);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> takeItOnMe(
      String taskId, String currentStateId, String token) async {
    String url = '${ServiceTools.url.workorder_url}/task/add/user/to/state';
    bool result = false;

    try {
      final response = await super.dio.post(
            url,
            data: {
              "label": ["Task"],
              "identifier": taskId,
              "identifier_target": currentStateId
            },
            options: Options(
              headers: {'authorization': 'Bearer $token'},
              contentType: Headers.jsonContentType,
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == 'my') {
          result = true;
          return Left(result);
        } else {
          result = false;
          return Right(CustomServiceException(
              message: CustomServiceMessages.work,
              statusCode: response.statusCode.toString()));
        }
      } else {
        result = false;
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }

  @override
  Future<Either<TaskResponseEnums, CustomServiceException>>
      changeWorkSpaceState(
          String taskId, String nextStateId, String token) async {
    String url = '${ServiceTools.url.workorder_url}/task/change/state/of/task';
    TaskResponseEnums result;

    try {
      final response = await super.dio.post(
            url,
            data: {
              "label": ["Task"],
              "identifier": taskId, // task id
              "identifier_target": nextStateId // next state id
            },
            options: Options(
              headers: {'authorization': 'Bearer $token'},
              contentType: Headers.jsonContentType,
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        super.logger.i(response.data);

        if (response.data == TaskResponseEnums.end.rawValue) {
          result = TaskResponseEnums.end;
        } else if (response.data == TaskResponseEnums.my.rawValue) {
          result = TaskResponseEnums.my;
        } else if (response.data == TaskResponseEnums.our.rawValue) {
          result = TaskResponseEnums.our;
        } else if (response.data == TaskResponseEnums.pendiks.rawValue) {
          result = TaskResponseEnums.pendiks;
        } else {
          result = TaskResponseEnums.error;
        }
        return Left(result);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }

  @override
  Future<
      Either<List<WorkSpaceRequirementMaterialsList>,
          CustomServiceException>> getWorkSpaceApprovedRequirementMaterialsList(
    String taskId,
    String token,
  ) async {
    List<WorkSpaceRequirementMaterialsList> workSpaceRequirementMaterialsList;
    String url =
        '${ServiceTools.url.workorder_url}/task/mobile/getMaterialRequestByTaskId/$taskId';

    try {
      final response = await super.dio.get(
            url,
            data: {},
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        workSpaceRequirementMaterialsList =
            WorkSpaceRequirementMaterialsList.fromJsonList(data);

        return Left(workSpaceRequirementMaterialsList);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }

  @override
  Future<
      Either<List<WorkSpaceRequirementMaterialsList>,
          CustomServiceException>> getWorkSpaceRequirementMaterialsList(
    String taskId,
    String token,
  ) async {
    List<WorkSpaceRequirementMaterialsList> workSpaceRequirementMaterialsList;
    String url =
        '${ServiceTools.url.workorder_url}/task/mobile/getMaterialRequestByTaskId/$taskId';

    try {
      final response = await super.dio.get(
            url,
            data: {},
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        workSpaceRequirementMaterialsList =
            WorkSpaceRequirementMaterialsList.fromJsonList(data);

        return Left(workSpaceRequirementMaterialsList);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> saveDocumant(
    String filePath,
    String fileName,
    String description,
    String token,
    String taskId,
    String taskKey,
    String key,
  ) async {
    bool result = false;
    String url =
        '${ServiceTools.url.workorder_url}/task/addFiles/$taskId/$taskKey';
    String app = '';

    if (key == 'image') {
      app = 'image';
    } else if (key == 'pdf') {
      app = 'application';
    }

    final bytes = File(filePath).readAsBytesSync();
    String extension = fileName.split(".").last;

    var formData = FormData.fromMap({
      "document": MultipartFile.fromBytes(
        bytes,
        filename: fileName,
        contentType: MediaType(app, extension),
      ),
    });

    try {
      final response = await super.dio.post(
            url,
            data: formData,
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        if (data['success'] == true) {
          result = true;
          return Left(result);
        } else {
          result = false;
          return Left(result);
        }
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e.toString());
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }

  @override
  Future<Either<WorkSpaceDetail, CustomServiceException>> getWorkSpaceByTaskId(
      String taskId, String token) async {
    WorkSpaceDetail workSpaceDetail;

    final String url =
        '${ServiceTools.url.workorder_url}/task/task/get/by/id/with/workspace/currentState/calendar/$taskId?page=1&limit=1';
    try {
      final response = await super.dio.get(
            url,
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        workSpaceDetail = WorkSpaceDetail.fromJsonList(data).first;

        return Left(workSpaceDetail);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.e(e.toString());
      return Right(CustomServiceException(
          message: CustomServiceMessages.work, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkSpaceDocuments>, CustomServiceException>>
      getWorkSpaceDocuments(String token, String taskId) async {
    List<WorkSpaceDocuments> workSpaceDocuments;

    String url =
        '${ServiceTools.url.workorder_url}/task/mobile/getDocumentsByTaskId/$taskId';

    try {
      final response = await super.dio.get(
            url,
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        workSpaceDocuments = WorkSpaceDocuments.fromJsonList(data);
        super.logger.i(workSpaceDocuments);

        return Left(workSpaceDocuments);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.e(e.toString());
      return Right(CustomServiceException(
          message: CustomServiceMessages.work, statusCode: '500'));
    }
  }

  @override
  Future<Either<WorkSpaceDetail, CustomServiceException>>
      getWorkSpaceWithSearchFromGroupWorks(
          String workOrderCode, String token) async {
    List<WorkSpaceDetail> workSpaceDetailList;
    String url =
        '${ServiceTools.url.workorder_url}/task/workSpace/task/state/List/can/be/assigned/user/pagination/swagger/search?page=1&limit=10&orderBy=DESC&searchString=$workOrderCode';
    try {
      final response = await super.dio.get(
            url,
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        workSpaceDetailList = WorkSpaceDetail.fromJsonList(data);

        return Left(workSpaceDetailList.first);
      } else {
        return Right(CustomServiceException(
            message: CustomServiceMessages.work,
            statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(
          message: CustomServiceMessages.workOrderWorkloadError,
          statusCode: '500'));
    }
  }
}
