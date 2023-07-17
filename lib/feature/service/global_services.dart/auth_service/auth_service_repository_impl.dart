import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:vm_fm_4/feature/exceptions/custom_service_exceptions.dart';
import 'package:vm_fm_4/feature/models/auth_models/check_access_token_model.dart';

import 'package:vm_fm_4/feature/models/auth_models/login_model.dart';

import 'auth_service_repository.dart';

class AuthServiceRepositoryImpl extends AuthServiceRepository {
  @override
  Future<Either<LoginModel, CustomServiceException>> login(String username, String password) async {
    @override
    String url = 'http://localhost:3012/user/login';

    try {
      final response = await super.dio.post(
            url,
            data: {'username': username, 'password': password},
            options: Options(
              responseType: ResponseType.json,
              sendTimeout: const Duration(seconds: 3),
              receiveTimeout: const Duration(seconds: 3),
            ),
          );

      final data = response.data;

      LoginModel loginModel = LoginModel.fromJson(data);

      return Left(loginModel);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<CheckAccesTokenModel, CustomServiceException>> checkAccessToken(String token) async {
    String url = 'http://localhost:3012/user/checkAccessToken';

    try {
      final response = await super.dio.post(url,
          options: Options(
            headers: {'authorization': 'Bearer $token'},
            sendTimeout: const Duration(seconds: 4),
            receiveTimeout: const Duration(seconds: 4),
            responseType: ResponseType.json,
          ));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

        CheckAccesTokenModel checkAccesTokenModel = CheckAccesTokenModel.fromJson(data);

        return Left(checkAccesTokenModel);
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.tokenChangeError, statusCode: '400'));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.tokenChangeError, statusCode: '400'));
    }
  }
}
