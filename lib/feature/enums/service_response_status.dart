enum ServiceResponseStatus { result, records, detail }

extension ServiceResponseStatusExtension on ServiceResponseStatus {
  String get rawText {
    switch (this) {
      case ServiceResponseStatus.result:
        return 'result';
      case ServiceResponseStatus.records:
        return 'records';
      case ServiceResponseStatus.detail:
        return 'detail';
      default:
        return 'unknown';
    }
  }
}
