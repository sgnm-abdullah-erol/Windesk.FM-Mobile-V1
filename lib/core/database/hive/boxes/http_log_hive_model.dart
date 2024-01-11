import 'package:hive_flutter/hive_flutter.dart';

part 'http_log_hive_model.g.dart';

@HiveType(typeId: 1)
class HttpLogHiveModel {
  @HiveField(0)
  final String? response;
  @HiveField(1)
  final String? requestPath;
  @HiveField(2)
  final int? statusCode;
  @HiveField(3)
  final String? headers;
  @HiveField(4)
  final String? error;
  @HiveField(5)
  final String? logCatchError;
  @HiveField(6)
  final String? date;
  @HiveField(7)
  final String? userToken;

  HttpLogHiveModel({
    this.response,
    this.requestPath,
    this.statusCode,
    this.headers,
    this.error,
    this.logCatchError,
    this.date,
    this.userToken,
  });
}
