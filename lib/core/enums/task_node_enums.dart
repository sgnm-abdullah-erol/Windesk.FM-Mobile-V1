enum TaskNodeEnums { effort, spare, document }

extension TaskNodeExtension on TaskNodeEnums {
  String get name {
    switch (this) {
      case TaskNodeEnums.effort:
        return 'Effort';
      case TaskNodeEnums.spare:
        return 'Spare';
      case TaskNodeEnums.document:
        return 'Document';
      default:
        return '';
    }
  }

  String get variableName {
    switch (this) {
      case TaskNodeEnums.effort:
        return 'effort';
      case TaskNodeEnums.spare:
        return 'usedSpareOf';
      case TaskNodeEnums.document:
        return 'attachedDocuments';
      default:
        return '';
    }
  }
}
