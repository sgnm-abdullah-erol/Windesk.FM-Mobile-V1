import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../exceptions/custom_service_exceptions.dart';
import '../../../models/work_space/work_space_appendings.dart';
import '../../../models/work_space/work_space_detail.dart';
import '../../../models/work_space/work_space_efforts.dart';
import '../../../models/work_space/work_space_my_group_demand_list.dart';
import 'work_space_service_repository.dart';

class WorkSpaceServiceRepositoryImpl extends WorkSpaceServiceRepository {
  @override
  Future<Either<List<WorkSpaceDetail>, CustomServiceException>> getMyWorkSpaces(String id, String token, int page) async {
    List<WorkSpaceDetail> workSpaceDetailList = [];

    String url = 'http://localhost:3015/task/workSpace/task/state/List/for/assigned/user/pagination/$id';

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
  Future<Either<WorkSpaceMyGroupDemandList, CustomServiceException>> getMyGroupDemandList(String token) async {
    WorkSpaceMyGroupDemandList workSpaceMyGroupDemandList;

    String url = 'http://localhost:3015/classification/getRequestTypeWithTaskCount';

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
    String url = 'http://localhost:3015/task/workSpace/task/state/List/can/be/approve/current/user/pagination/$id';

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
  Future<Either<WorkSpaceDetail, CustomServiceException>> getWorkOrderWithSearch(String workOrderCode, String token) async {
    List<WorkSpaceDetail> workSpaceDetailList;
    String url = 'http://localhost:3015/task/workSpace/task/state/List/for/assigned/user/pagination/swagger/search?&searchString=$workOrderCode';

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
  Future<Either<List<WorkSpaceEfforts>, CustomServiceException>> getWorkOrderEfforts(String taskId, String token) async {
    List<WorkSpaceEfforts> workSpaceEfforts;
    String url = 'http://localhost:3015/task/mobile/getEffortsByTaskId/$taskId';

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
}
