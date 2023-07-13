import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vm_fm_4/feature/exceptions/custom_service_exceptions.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_detail.dart';
import 'package:vm_fm_4/feature/service/global_services.dart/work_space_service/work_space_service_repository.dart';

class WorkSpaceServiceRepositoryImpl extends WorkSpaceServiceRepository {
  @override
  Future<Either<List<WorkSpaceDetail>, CustomServiceException>> getMyWorkSpaces(String id, String token, int page) async {
    List<WorkSpaceDetail> workSpaceDetailList = [];

    String url = 'http://10.0.2.2:3015/task/workSpace/task/state/List/for/assigned/user/pagination/$id';

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

        super.logger.e(workSpaceDetailList);

        return Left(workSpaceDetailList);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.work, statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.workOrderWorkloadError, statusCode: '500'));
    }
  }
}
