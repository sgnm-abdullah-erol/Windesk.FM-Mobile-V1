import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vm_fm_4/feature/exceptions/custom_service_exceptions.dart';

import '../../../injection.dart';
import '../../../log/log_manager.dart';
import '../../service_manager.dart';

abstract class DownloadServiceRepository {
  final Dio dio = Injection.getIt.get<ServiceManager>().dio;
  final logger = Injection.getIt.get<LogManager>().logger;

  Future<Either<dynamic, CustomServiceException>> downloadFile(String url, String filePath);
}
