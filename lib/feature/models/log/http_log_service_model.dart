import 'package:equatable/equatable.dart';

class HttpLogServiceModel<T> extends Equatable {
  final T? response;
  final String? requestPath;
  final int? statusCode;
  final String? headers;
  final String? date;
  final String? error;
  final String? logCatchError;

  const HttpLogServiceModel({
    required this.response,
    required this.requestPath,
    required this.statusCode,
    required this.headers,
    required this.date,
    required this.logCatchError,
    this.error,
  });

  @override
  List<Object?> get props => [
        response,
        requestPath,
        statusCode,
        headers,
        date,
        error,
      ];
}
