// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vm_fm_4/core/constants/paths/service_tools.dart';
import 'package:vm_fm_4/core/database/shared_manager.dart';
import 'package:vm_fm_4/core/enums/shared_enums.dart';
import 'package:vm_fm_4/feature/service/log/log_service.dart';
import 'package:vm_fm_4/feature/service/log/log_service_model.dart';

class ServiceManager {
  late final Dio dio;

  ServiceManager() {
    // final logService = Injection.getIt.get<LogService>();

    final BaseOptions baseOptions = BaseOptions(
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 40),
      sendTimeout: const Duration(seconds: 40),
      receiveTimeout: const Duration(seconds: 40),
    );
    dio = Dio(baseOptions);

    // log interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) {
          return handler.next(options);
        },
        onResponse: (Response response, handler) async {
          await _parseResponse(response);
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          await _parseError(error);
          return handler.next(error);
        },
      ),
    );
  }

  Future<void> _parseResponse(Response response) async {
    if (response.realUri.toString() == '${ServiceTools.url.log_url}/mobile/log') {
      return;
    } else {
      String userToken = await SharedManager().getString(SharedEnum.userToken);
      LogService.singleLogServiceRequest(
        dio,
        userToken,
        LogServiceModel(
          response: jsonEncode(response.data),
          requestPath: response.realUri.toString(),
          statusCode: response.statusCode,
          headers: jsonEncode(response.headers.toString()),
          date: DateTime.now().toIso8601String(),
          logCatchError: '',
          error: null,
        ),
      );
    }
  }

  Future<void> _parseError(DioException error) async {
    if (error.requestOptions.path == '${ServiceTools.url.log_url}/log') {
      return;
    } else {
      String userToken = await SharedManager().getString(SharedEnum.userToken);
      LogService.singleLogServiceRequest(
        dio,
        userToken,
        LogServiceModel(
          response: const {},
          requestPath: error.requestOptions.path,
          statusCode: error.response?.statusCode,
          headers: jsonEncode(error.response?.headers.toString()),
          date: DateTime.now().toIso8601String(),
          logCatchError: '',
          error: error.message,
        ),
      );
    }
  }
}
