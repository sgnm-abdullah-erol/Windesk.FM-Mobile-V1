import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vm_fm_4/feature/service/global_services.dart/download/download_service_repository.dart';

import '../../../exceptions/custom_service_exceptions.dart';

class DownloadServiceRepositoryImpl extends DownloadServiceRepository {
  @override
  Future<Either<dynamic, CustomServiceException>> downloadFile(String url, String filePath) async {
    try {
      final response = await super.dio.get(
            url,
            options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
            ),
          );

      return Left(response.data);
    } catch (e) {
      super.logger.i(e);
      return Right(CustomServiceException(message: e.toString(), statusCode: '500'));
    }
  }
}
