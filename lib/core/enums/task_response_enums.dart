enum TaskResponseEnums { my, our, pendiks, end, error }

extension TaskResponseEnumsExtension on TaskResponseEnums {
  String get rawValue {
    switch (this) {
      case TaskResponseEnums.my:
        return 'my';
      case TaskResponseEnums.our:
        return 'our';
      case TaskResponseEnums.pendiks:
        return 'pendiks';
      case TaskResponseEnums.end:
        return 'end';
      case TaskResponseEnums.error:
        return 'error';
      default:
        return 'error';
    }
  }
}
