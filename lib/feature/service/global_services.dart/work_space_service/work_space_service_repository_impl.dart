// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vm_fm_4/feature/models/reject_state_models/reject_state_model.dart';
import 'package:vm_fm_4/feature/models/work_order_models/delivered_spare_of_model.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_current_state.dart';
import 'package:vm_fm_4/feature/models/work_space/child_location_structure.dart';
import 'package:vm_fm_4/feature/models/work_space/main_location_structure.dart';

import '../../../../core/constants/paths/service_tools.dart';
import '../../../../core/enums/task_node_enums.dart';
import '../../../../core/enums/task_response_enums.dart';
import '../../../exceptions/custom_service_exceptions.dart';
import '../../../models/home_page_models/asset_list_model.dart';
import '../../../models/work_space/work_space_appendings.dart';
import '../../../models/work_space/work_space_detail.dart';
import '../../../models/work_space/work_space_documents.dart';
import '../../../models/work_space/work_space_efforts.dart';
import '../../../models/work_space/work_space_my_group_demand_list.dart';
import '../../../models/work_space/work_space_note.dart';
import '../../../models/work_space/work_space_requested_materials_inventory.dart';
import '../../../models/work_space/work_space_requirement_materials_list.dart';
import '../../../models/work_space/work_space_spareparts.dart';
import '../../../models/work_space/work_space_user_inventory.dart';
import 'work_space_service_repository.dart';

class WorkSpaceServiceRepositoryImpl extends WorkSpaceServiceRepository {
  @override
  Future<Either<List<WorkSpaceDetail>, CustomServiceException>> getMyWorkSpaces(String id, String token, int page) async {
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
      super.logger.w(response);
      return Left(workSpaceDetailList);
    } else {
      super.logger.wtf(response);
      return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
    }
  }

  Future<Either<List, CustomServiceException>> getTaskHistoryApi(String id, String token) async {
    String url = '${ServiceTools.url.workorder_url}/task/one/task/state/List/with/user/approver/date/hour/second/status/$id';
    final response = await super.dio.get(
          url,
          options: Options(
            headers: {'authorization': 'Bearer $token'},
          ),
        );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;

      return Left(data);
    } else {
      return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
    }
  }

  @override
  Future<Either<WorkSpaceMyGroupDemandList, CustomServiceException>> getMyGroupDemandList(String token) async {
    WorkSpaceMyGroupDemandList workSpaceMyGroupDemandList;

    String url = '${ServiceTools.url.workorder_url}/classification/getRequestTypeWithTaskCount';

    try {
      final response = await super.dio.post(
            url,
            options: Options(
              headers: {'authorization': 'Bearer $token'},
              responseType: ResponseType.json,
            ),
          );
      super.logger.e(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        workSpaceMyGroupDemandList = WorkSpaceMyGroupDemandList.fromJson(data);

        return Left(workSpaceMyGroupDemandList);
      } else {
        super.logger.e(response.statusCode);
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkSpacePendiks>, CustomServiceException>> getWorkSpacePendiks(String id, String token, int page) async {
    List<WorkSpacePendiks> workSpaceAppendings = [];
    String url = '${ServiceTools.url.workorder_url}/task/workSpace/task/state/List/can/be/approve/current/user/pagination/$id';

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
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<Either<WorkSpaceDetail, CustomServiceException>> getWorkSpaceWithSearch(String workOrderCode, String token) async {
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
        super.logger.e(response.toString());

        return Left(workSpaceDetailList.first);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  Future<Either<Map, CustomServiceException>> getSpaceSearch(String spaceText, String token) async {
    String url = '${ServiceTools.url.facility_url}/structure/search?q=$spaceText';
    try {
      final response = await super.dio.post(
            url,
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );
      final data = response.data;
      return Left(data);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<Either<AssetListModel, CustomServiceException>> getAssetWithSearchTagNumber(String assetCode, String token) async {
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
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<Either<AssetListModel, CustomServiceException>> getAssetWithSearchIdentifier(String assetCode, String token) async {
    AssetListModel assetListModel;
    String url =
        '${ServiceTools.url.asset_url}/component/searchByColumn/?page=1&limit=10&orderBy=ASC&orderByColumn=&searchColumn=assetIdentifier&searchString=$assetCode&searchType=CONTAINS';
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
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkSpaceDetail>, CustomServiceException>> getWorkSpaceDetailsByRequestType(String requestId, int page, String token) async {
    List<WorkSpaceDetail> workSpaceDetailList = [];
    String url =
        '${ServiceTools.url.workorder_url}/task/mobile/getTasksByRequestType/swagger/$requestId?page=$page&limit=999&orderBy=DESC&orderByColumn=updateAt&withSpare=true';
    try {
      final response = await super.dio.get(
            url,
            data: {},
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      super.logger.d(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        workSpaceDetailList = WorkSpaceDetail.fromJsonList(data);
        return Left(workSpaceDetailList);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkSpaceEfforts>, CustomServiceException>> getWorkSpaceEfforts(String taskId, String token) async {
    List<WorkSpaceEfforts> workSpaceEfforts;
    String url = '${ServiceTools.url.workorder_url}/task/mobile/getEffortsByTaskId/$taskId';

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
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
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
      super.logger.i(data);
      return Left(result);
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkSpaceSpareparts>, CustomServiceException>> getWorkSpaceSpareparts(String taskId, String token) async {
    List<WorkSpaceSpareparts> workSpaceSpareparts;
    String url = '${ServiceTools.url.workorder_url}/task/mobile/getSparesByTaskId/$taskId';

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

        super.logger.d(response);

        return Left(workSpaceSpareparts);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<Either<WorkSpaceUserInventory, CustomServiceException>> getWorkSpaceUserInventory(String token) async {
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
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> addWorkSpaceSpareparts(String taskId, String token, String sparePartId, String amount) async {
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

      super.logger.i(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

        super.logger.d(response);

        if (data == 'added') {
          result = true;
        } else {
          result = false;
        }

        super.logger.i(data);
        return Left(result);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkSpaceRequestedMaterialsInventory>, CustomServiceException>> getWorkSpaceRequestedMaterialsInventory(
    String token,
    int page,
  ) async {
    List<WorkSpaceRequestedMaterialsInventory> workSpaceRequestedMaterials;
    String url =
        '${ServiceTools.url.asset_url}/types/getMobileAllTypesWithMeasurementUnitAndAmount?page=1&limit=1000&orderBy=ASC&orderByColumn=name&decision=true&superSet=Spare';

    try {
      final response = await super.dio.get(
            url,
            data: {
              // "options": {
              //   "page": 1,
              //   "limit": 10000,
              //   "orderBy": "ASC",
              //   "orderByColumn": "name",
              //   "decision": "true",
              //   "superSet": Spare,
              // }
            },
            options: Options(
              headers: {
                'authorization': 'Bearer $token',
              },
            ),
          );

      super.logger.d(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        workSpaceRequestedMaterials = WorkSpaceRequestedMaterialsInventory.fromJsonList(data) ?? [];
        return Left(workSpaceRequestedMaterials);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
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
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> takeItOnMe(String taskId, String currentStateId, String token) async {
    //print('asdasdsaads' + taskId +':::'+ currentStateId +' ::::'+ token);

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
          super.logger.i(response.data);
          result = false;
          return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
        }
      } else {
        super.logger.i(response.data);
        result = false;
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.e(e);
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<Either<TaskResponseEnums, CustomServiceException>> changeWorkSpaceState(
      String taskId, String nextStateId, String token, String? groupId) async {
    String url = '${ServiceTools.url.workorder_url}/task/change/approve/state/of/task';
    TaskResponseEnums result;

    try {
      final response = await super.dio.post(
            url,
            data: groupId != ''
                ? {
                    "label": ["Task"],
                    "identifier": taskId, // task id
                    "identifier_target": nextStateId, // next state id
                    "identifier_target_target": groupId ?? '' //group id
                  }
                : {
                    "label": ["Task"],
                    "identifier": taskId, // task id
                    "identifier_target": nextStateId, // next state id
                  },
            options: Options(
              headers: {'authorization': 'Bearer $token'},
              contentType: Headers.jsonContentType,
            ),
          );

      super.logger.d(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        super.logger.i(response.data);

        if (response.data == TaskResponseEnums.finished.rawValue) {
          result = TaskResponseEnums.finished;
        } else if (response.data == TaskResponseEnums.my.rawValue) {
          result = TaskResponseEnums.my;
        } else if (response.data == TaskResponseEnums.our.rawValue) {
          result = TaskResponseEnums.our;
        } else if (response.data == TaskResponseEnums.pending.rawValue) {
          result = TaskResponseEnums.pending;
        } else if (response.data == TaskResponseEnums.end.rawValue) {
          result = TaskResponseEnums.end;
        } else {
          result = TaskResponseEnums.error;
        }
        return Left(result);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<DeliveredSpareOfModel>, CustomServiceException>> getWorkSpaceApprovedRequirementMaterialsList(
    String taskId,
    String token,
  ) async {
    List<DeliveredSpareOfModel>? workSpaceRequirementMaterialsList = [];
    String url = '${ServiceTools.url.workorder_url}/task/$taskId';

    final response = await super.dio.get(
          url,
          options: Options(
            headers: {'authorization': 'Bearer $token'},
          ),
        );

    super.logger.wtf(response);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;
      workSpaceRequirementMaterialsList = DeliveredSpareOfModel.fromJsonList(data['deliveredSpareOf']);

      super.logger.wtf(workSpaceRequirementMaterialsList);

      return Left(workSpaceRequirementMaterialsList);
    } else {
      return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
    }
  }

  @override
  Future<Either<List<WorkSpaceRequirementMaterialsList>, CustomServiceException>> getWorkSpaceRequirementMaterialsList(
    String taskId,
    String token,
  ) async {
    List<WorkSpaceRequirementMaterialsList> workSpaceRequirementMaterialsList;
    String url = '${ServiceTools.url.workorder_url}/task/mobile/getMaterialRequestByTaskId/$taskId';

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
        workSpaceRequirementMaterialsList = WorkSpaceRequirementMaterialsList.fromJsonList(data);

        return Left(workSpaceRequirementMaterialsList);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
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

    String url = '${ServiceTools.url.workorder_url}/task/addFiles/$taskId/$taskKey';
    String app = '';

    if (key == 'image') {
      app = 'image';
    } else if (key == 'pdf') {
      app = 'application';
    }

    final bytes = File(filePath).readAsBytesSync();
    String extension = fileName.split(".").last;

    // var formData = FormData.fromMap({
    //   "document": MultipartFile.fromBytes(
    //     bytes,
    //     filename: fileName,
    //     contentType: MediaType(app, extension),
    //   ),
    // });
    if (fileName == '') {
      fileName = '${DateTime.now().toIso8601String()}.png';
    }
    FormData formData = FormData.fromMap({
      "document": await MultipartFile.fromFile(
        File(filePath).path,
        filename: fileName,
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

      super.logger.i(response);

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
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<Either<WorkSpaceDetail, CustomServiceException>> getWorkSpaceByTaskId(String taskId, String token) async {
    WorkSpaceDetail workSpaceDetail;

    final String url = '${ServiceTools.url.workorder_url}/task/task/get/by/id/with/workspace/currentState/calendar/$taskId?page=1&limit=1';
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
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.e(e.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: '500'));
    }
  }

  @override
  Future<Either<List<WorkSpaceDocuments>, CustomServiceException>> getWorkSpaceDocuments(String token, String taskId) async {
    List<WorkSpaceDocuments> workSpaceDocuments;

    String url = '${ServiceTools.url.workorder_url}/task/mobile/getDocumentsByTaskId/$taskId';

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
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.e(e.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: '500'));
    }
  }

  @override
  Future<Either<WorkSpaceDetail, CustomServiceException>> getWorkSpaceWithSearchFromGroupWorks(String workOrderCode, String token) async {
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
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<bool> deleteNodeFromTask(String userToken, String taskId, String labelId, TaskNodeEnums labelType) async {
    bool result = false;
    String url = '${ServiceTools.url.workorder_url}/task/delete/node/from/task';

    // attachedDocuments

    try {
      final response = await super.dio.post(
            url,
            data: {
              "deleteNodeFromTaskInput": [
                {
                  "childId": labelId,
                  "childLabel": [
                    labelType.name // Effort , Spare, Document
                  ],
                  "rootId": taskId,
                  "rootLabel": ["Task"],
                  "variableName": labelType.variableName // effort , usedSpareOf, attachedDocuments
                }
              ]
            },
            options: Options(
              headers: {'authorization': 'Bearer $userToken'},
            ),
          );

      super.logger.i(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        if (data['success'] == true) {
          result = true;
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (error) {
      super.logger.e(error.toString());
      return false;
    }
  }

  @override
  Future<Either<List<WorkSpaceDetail>, CustomServiceException>> getGroupWorkOrders(String userToken) async {
    String url =
        '${ServiceTools.url.workorder_url}/task/workSpace/task/state/List/can/be/assigned/user/pagination/swagger?page=1&limit=8&orderBy=DESC&orderByColumn%5B0%5D=updatedAt';
    List<WorkSpaceDetail> workSpaceDetailList = [];
    try {
      final response = await super.dio.get(
            url,
            options: Options(
              headers: {'authorization': 'Bearer $userToken'},
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        workSpaceDetailList = WorkSpaceDetail.fromJsonList(data);
        return Left(workSpaceDetailList);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }

  @override
  Future<bool> addNoteToWorkOrder(String userToken, String taskId, String value) async {
    String url = '${ServiceTools.url.workorder_url}/task/add/node/to/task';
    List<WorkSpaceDetail> workSpaceDetailList = [];
    try {
      final response = await super.dio.post(url,
          options: Options(
            headers: {'authorization': 'Bearer $userToken'},
          ),
          data: [
            {
              "label": [
                "Task",
              ],
              "identifier": taskId,
              "variableName": "note",
              "value": [
                value,
              ],
            }
          ]);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        super.logger.d(data);
        if (data == 'added') {
          return true;
        } else {}
        return false;
      } else {
        return false;
      }
    } catch (error) {
      super.logger.e(error.toString());
      return false;
    }
  }

  @override
  Future<List<WorkSpaceNote>> getWorkSpaceNotes(String taskId, String userToken) async {
    String url = '${ServiceTools.url.workorder_url}/task/$taskId';
    List<WorkSpaceDetail> workSpaceDetailList = [];
    try {
      final response = await super.dio.get(
            url,
            options: Options(
              headers: {'authorization': 'Bearer $userToken'},
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        super.logger.d(data);
        if (data['note'] != null) {
          return WorkSpaceNote.fromJsonList(data['note']);
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (error) {
      super.logger.e(error.toString());
      return [];
    }
  }

  @override
  Future<Either<CurrentState, CustomServiceException>> getWorkSpaceStateGroups(
    String taskId,
    String workSpaceId,
    String token,
  ) async {
    CurrentState currentState;
    String url = '${ServiceTools.url.workorder_url}/task/task/current/state/$workSpaceId/$taskId';

    try {
      final response = await super.dio.get(
            url,
            data: {},
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['currentState'];
        currentState = CurrentState.fromJson(data);

        return Left(currentState);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.stateGroups, statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(message: CustomServiceMessages.stateGroups, statusCode: '500'));
    }
  }

  @override
  Future<MainLocationStructure> getMainLocationStructure(String userToken) async {
    String url = '${ServiceTools.url.location_url}/structures';
    try {
      final response = await super.dio.get(
            url,
            options: Options(
              headers: {'authorization': 'Bearer $userToken'},
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        super.logger.d(data);
        if (data != null) {
          return MainLocationStructure.fromJson(data);
        } else {
          return const MainLocationStructure();
        }
      } else {
        return const MainLocationStructure();
      }
    } catch (error) {
      super.logger.e(error.toString());
      return const MainLocationStructure();
    }
  }

  @override
  Future<List<ChildLocationStructure>> getChildLocationStructure(String userToken, String key, String label) async {
    String url = '${ServiceTools.url.location_url}/jointspaces/lazyLoadingByKey/';
    try {
      final response = await super.dio.post(
        url,
        options: Options(
          headers: {'authorization': 'Bearer $userToken'},
        ),
        data: {
          "key": key,
          "leafType": "Space",
          "rootLabels": [label],
          "childrenLabels": [],
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        super.logger.d(data);
        if (data != null) {
          final main = MainLocationStructure.fromJson(data);
          return main.children ?? [];
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (error) {
      super.logger.e(error.toString());
      return [];
    }
  }

  @override
  Future<List<RejectStateModel>> getWorkSpaceRejectStateGroups(String taskId, String workSpaceId, String token) async {
    // task/task/current/state/412/1885
    String url = '${ServiceTools.url.workorder_url}/task/task/current/state/$workSpaceId/$taskId';
    try {
      final response = await super.dio.get(
            url,
            options: Options(headers: {'authorization': 'Bearer $token'}),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        super.logger.wtf(data);
        if (data != null) {
          final dataData = data['currentState'];
          final main = RejectStateModel.fromJsonList(dataData['rejectStates']);
          return main;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (error) {
      super.logger.e(error.toString());
      return [];
    }
  }

    @override
  Future<Either<bool, CustomServiceException>> saveDocumentForMaintenance(
    String filePath,
    String fileName,
    String token,
    String label,
    int id,
    String key,
  ) async {
    bool result = false;

    String url = '${ServiceTools.url.workorder_url}/maintenance/addFiles';
    String app = '';

    if (key == 'image') {
      app = 'image';
    } else if (key == 'pdf') {
      app = 'application';
    }

    final bytes = File(filePath).readAsBytesSync();
    String extension = fileName.split(".").last;

    // var formData = FormData.fromMap({
    //   "document": MultipartFile.fromBytes(
    //     bytes,
    //     filename: fileName,
    //     contentType: MediaType(app, extension),
    //   ),
    // });
    if (fileName == '') {
      fileName = '${DateTime.now().toIso8601String()}.png';
    }
    FormData formData = FormData.fromMap({
      "documents": await MultipartFile.fromFile(
        File(filePath).path,
        filename: fileName,
      ),
      "body":{
        "id": id,
        "labels":[label],
        "key":key
      }
    });

    try {
      final response = await super.dio.post(
            url,
            data: formData,
            options: Options(
              headers: {'authorization': 'Bearer $token'},
            ),
          );

      super.logger.i(response);

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
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (e) {
      super.logger.i(e.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }
}
