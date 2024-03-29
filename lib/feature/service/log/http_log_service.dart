import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:vm_fm_4/core/constants/paths/service_tools.dart';
import 'package:vm_fm_4/core/database/hive/box_manager.dart';
import 'package:vm_fm_4/core/database/hive/boxes/http_log_hive_model.dart';
import 'package:vm_fm_4/feature/models/log/http_log_service_model.dart';

class HttpLogService {
  static Future<void> singleLogServiceRequest(Dio dio, String userToken, HttpLogServiceModel serviceModel) async {
    String url = '${ServiceTools.url.log_url}/mobile/log';
    try {
      await dio.post(
        url,
        data: {
          'response': serviceModel.response,
          'requestPath': serviceModel.requestPath,
          'statusCode': serviceModel.statusCode,
          'headers': serviceModel.headers,
          'error': serviceModel.error ?? '',
        },
        options: Options(
          headers: {
            'authorization': 'Bearer $userToken',
          },
        ),
      );
    } catch (error) {
      final Box<HttpLogHiveModel> logBox = BoxManager.logBox;
      final logHiveModel = HttpLogHiveModel(
        response: serviceModel.response.toString(),
        requestPath: serviceModel.requestPath,
        statusCode: serviceModel.statusCode,
        headers: serviceModel.headers,
        error: serviceModel.error,
        logCatchError: error.toString(),
        date: serviceModel.date,
        userToken: userToken,
      );

      logBox.add(logHiveModel);
    }
  }
}
