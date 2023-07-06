enum ServiceStatusEnums {
  success,
}

extension ServiceStatusEnumsExtension on ServiceStatusEnums {
  String get rawText {
    switch (this) {
      case ServiceStatusEnums.success:
        return 'success';
      default:
        return 'unknown';
    }
  }
}
