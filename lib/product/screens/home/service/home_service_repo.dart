import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../feature/exceptions/custom_service_exceptions.dart';
import '../../../../feature/injection.dart';
import '../../../../feature/log/log_manager.dart';
import '../../../../feature/models/home_page_models/announcement_model.dart';
import '../../../../feature/service/service_manager.dart';

abstract class HomeServiceRepository {
  final Dio dio = Injection.getIt.get<ServiceManager>().dio;
  final logger = Injection.getIt.get<LogManager>().logger;

  // TEST METHODS
  Future<Either<bool, CustomServiceException>> logout();
  Future<Either<List<AnnouncementModel>, CustomServiceException>> getAnnouncements();
}
