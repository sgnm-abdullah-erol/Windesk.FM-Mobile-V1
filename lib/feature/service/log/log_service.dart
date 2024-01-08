import 'package:dio/dio.dart';
import 'package:vm_fm_4/core/constants/paths/service_tools.dart';
import 'package:vm_fm_4/feature/service/log/log_service_model.dart';

class LogService {
  static Future<void> singleLogServiceRequest(Dio dio, String userToken, LogServiceModel serviceModel) async {
    String url = '${ServiceTools.url.log_url}/log';
    print('asdasdasdasdads');

    try {
      final response = await dio.post(
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
      print(response);
    } catch (error) {
      print('ERROR IN LOG SERVICE');
      print(error);
      // MANAGE LOG ERROR IN LOCAL DATABASE
      // SAVE LOG ERRORS IN LOCAL DATABASE AND SEND THEM WHEN THE INTERNET IS CONNECTED
    }
  }
}
