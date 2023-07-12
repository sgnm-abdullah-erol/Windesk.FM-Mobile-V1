enum ServiceStatusEnums {
  success,
  resultCode
}

extension ServiceStatusEnumsExtension on ServiceStatusEnums {
  String get rawText {
    switch (this) {
      case ServiceStatusEnums.success:
        return 'success';
      case ServiceStatusEnums.resultCode:
        return '200';
      default:
        return 'unknown';
    }
  }
}
