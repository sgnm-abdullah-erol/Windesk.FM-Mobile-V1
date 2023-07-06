import 'package:dio/dio.dart';

class ServiceManager {
  late final Dio dio;

  ServiceManager() {
    final BaseOptions baseOptions = BaseOptions();
    dio = Dio(baseOptions);
  }
}
