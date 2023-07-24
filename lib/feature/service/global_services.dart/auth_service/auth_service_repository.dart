import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../exceptions/custom_service_exceptions.dart';
import '../../../injection.dart';
import '../../../log/log_manager.dart';
import '../../../models/auth_models/check_access_token_model.dart';
import '../../../models/auth_models/login_model.dart';
import '../../service_manager.dart';

abstract class AuthServiceRepository {
  final Dio dio = Injection.getIt.get<ServiceManager>().dio;
  final logger = Injection.getIt.get<LogManager>().logger;

  Future<Either<LoginModel, CustomServiceException>> login(String username, String password);

  Future<Either<bool, CustomServiceException>> logout(String refreshToken, String token);

  Future<Either<CheckAccesTokenModel, CustomServiceException>> checkAccessToken(String token);
}
