import 'package:equatable/equatable.dart';

class LogServiceModel<T> extends Equatable {
  final T? response;
  final String? requestPath;
  final int? statusCode;
  final String? headers;
  final DateTime? date;
  final String? error;

  const LogServiceModel({
    required this.response,
    required this.requestPath,
    required this.statusCode,
    required this.headers,
    required this.date,
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
