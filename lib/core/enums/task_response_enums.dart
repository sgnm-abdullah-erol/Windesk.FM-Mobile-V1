enum TaskResponseEnums { my, our, pending, finished, error, end }

extension TaskResponseEnumsExtension on TaskResponseEnums {
  String get rawValue {
    switch (this) {
      case TaskResponseEnums.my:
        return 'my';
      case TaskResponseEnums.our:
        return 'our';
      case TaskResponseEnums.pending:
        return 'pending';
      case TaskResponseEnums.finished:
        return 'finished';
      case TaskResponseEnums.end:
        return 'end';
      case TaskResponseEnums.error:
        return 'error';
      default:
        return 'error';
    }
  }
}
