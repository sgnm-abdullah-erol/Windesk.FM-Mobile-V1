enum SnackbarEnums {
  info,
  success,
  error,
  connect,
  notconnect,
  enumTrue,
  enumFalse,
}

extension SnackbarEnumsExtension on SnackbarEnums {
  String get rawText {
    switch (this) {
      case SnackbarEnums.info:
        return 'info';
      case SnackbarEnums.success:
        return 'success';
      case SnackbarEnums.error:
        return 'error';
      case SnackbarEnums.connect:
        return 'connect';
      case SnackbarEnums.notconnect:
        return 'notconnect';
      case SnackbarEnums.enumTrue:
        return 'true';
      case SnackbarEnums.enumFalse:
        return 'false';
      default:
        return 'unknown';
    }
  }
}
