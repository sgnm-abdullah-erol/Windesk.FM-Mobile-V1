import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:vm_fm_4/feature/exceptions/custom_service_exceptions.dart';
import 'package:vm_fm_4/feature/models/auth_models/check_access_token_model.dart';

import 'package:vm_fm_4/feature/models/auth_models/login_model.dart';

import '../../../enums/service_response_status_enums.dart';
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
            options: Options(),
          );

      final data = response.data;

      LoginModel loginModel = LoginModel.fromJson(data);

      super.logger.i(loginModel);

      return Left(loginModel);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  @override
  Future<Either<bool, CustomServiceException>> logout(String refreshToken, String token) async {
    String url = 'http://10.0.2.2:3012/user/logout';

    try {
      final response = await super.dio.post(
            url,
            options: Options(
              headers: {
                'authorization': 'Bearer $token',
                'refresh_token': refreshToken,
              },
            ),
          );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        super.logger.i(data);
        if (data[ServiceResponseStatusEnums.success.rawText] == true) {
          super.logger.i('logout success');
          return const Left(true);
        } else {
          return Right(CustomServiceException(message: CustomServiceMessages.logoutError, statusCode: '400'));
        }
      } else {
        return Right(CustomServiceException(message: CustomServiceMessages.logoutError, statusCode: '400'));
      }
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.logoutError, statusCode: '400'));
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
