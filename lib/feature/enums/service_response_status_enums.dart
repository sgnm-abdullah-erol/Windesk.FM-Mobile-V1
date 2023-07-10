enum ServiceResponseStatusEnums { result, records, detail }

extension ServiceResponseStatusExtension on ServiceResponseStatusEnums {
  String get rawText {
    switch (this) {
      case ServiceResponseStatusEnums.result:
        return 'result';
      case ServiceResponseStatusEnums.records:
        return 'records';
      case ServiceResponseStatusEnums.detail:
        return 'detail';
      default:
        return 'unknown';
    }
  }
}
