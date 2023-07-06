enum ServiceResponseStatus { result, records }

extension ServiceResponseStatusExtension on ServiceResponseStatus {
  String get rawText {
    switch (this) {
      case ServiceResponseStatus.result:
        return 'result';
      case ServiceResponseStatus.records:
        return 'records';
      default:
        return 'unknown';
    }
  }
}
