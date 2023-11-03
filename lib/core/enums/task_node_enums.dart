enum TaskNodeEnums { effort, spare, document, note }

extension TaskNodeExtension on TaskNodeEnums {
  String get name {
    switch (this) {
      case TaskNodeEnums.effort:
        return 'Effort';
      case TaskNodeEnums.spare:
        return 'Spare';
      case TaskNodeEnums.document:
        return 'Document';
      case TaskNodeEnums.note:
        return 'Note';
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
      case TaskNodeEnums.note:
        return 'note';
      default:
        return '';
    }
  }
}
