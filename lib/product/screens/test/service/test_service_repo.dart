import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/log/log_manager.dart';
import '../../../../feature/exceptions/custom_service_exceptions.dart';
import '../../../../feature/injection.dart';
import '../../../../feature/service/service_manager.dart';

abstract class TestServiceRepository {
  final Dio dio = Injection.getIt.get<ServiceManager>().dio;
  final logger = Injection.getIt.get<LogManager>().logger;

  // TEST METHODS
  Future<Either<bool, CustomServiceException>> accessTestWindesk();
  Future<Either<bool, CustomServiceException>> accessTestMobileService();
}
