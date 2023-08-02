import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../constants/paths/service_tools.dart';

import '../../../database/shared_manager.dart';
import '../../../enums/service_response_status_enums.dart';
import '../../../enums/shared_enums.dart';
import '../../../exceptions/custom_service_exceptions.dart';
import '../../../models/auth_models/check_access_token_model.dart';
import '../../../models/auth_models/login_model.dart';
import 'auth_service_repository.dart';

class AuthServiceRepositoryImpl extends AuthServiceRepository {
  @override
  Future<Either<LoginModel, CustomServiceException>> login(String username, String password) async {
    @override
    String url = '${ServiceTools.url.users_url}/user/loginMobile';
    String firebaseToken = await SharedManager().getString(SharedEnum.firebaseToken);

    try {
      final response = await super.dio.post(
            url,
            data: {'username': username, 'password': password, "firebaseToken": firebaseToken},
            options: Options(),
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
  Future<Either<bool, CustomServiceException>> logout(String refreshToken, String token) async {
    String url = '${ServiceTools.url.users_url}/user/logout';

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
        if (data[ServiceResponseStatusEnums.success.rawText] == true) {
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
    String url = '${ServiceTools.url.users_url}/user/checkAccessToken';

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
