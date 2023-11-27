import 'package:equatable/equatable.dart';

final class BaseResponseModel<T> extends Equatable {
  final T? data;
  final String? error;
  final String? message;

  const BaseResponseModel({this.data, this.error, this.message});

  @override
  List<Object?> get props => [
        data,
        error,
        message,
      ];
}
