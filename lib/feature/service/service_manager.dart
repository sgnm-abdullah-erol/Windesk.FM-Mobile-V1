import 'package:dio/dio.dart';
import 'package:vm_fm_4/feature/models/grapqhl_models/base_response_model.dart';

class ServiceManager {
  late final Dio dio;

  ServiceManager() {
    final BaseOptions baseOptions = BaseOptions(
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(baseOptions);
  }

  Future<BaseResponseModel> queryGraphQL(String url, String token, String query, Function parserFunction) async {
    try {
      final response = await dio.post(  
        url,
        options: Options(headers: {'authorization': 'Bearer $token'}, contentType: Headers.jsonContentType),
        data: {
          'query': query,
        },
      );
      return parserFunction(response: response, error: null);
    } on DioException catch (e) {
      return parserFunction(response: null, error: e.response!);
    }
  }
}
