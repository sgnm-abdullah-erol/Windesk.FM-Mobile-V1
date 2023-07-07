import 'package:flutter/material.dart';

class CustomServiceException implements Exception {
  final String message;
  final String statusCode;

  CustomServiceException({required this.message, required this.statusCode});

  @override
  String toString() {
    return message;
  }
}

@immutable
class CustomServiceMessages {
  const CustomServiceMessages._();

  static const String workOrderWorkloadError = 'Error while fetching workload';
  static const String workOrderAttachmentsError = 'Error while fetching attachments';
  static const String noInternetConnection = "No internet connection";
}
