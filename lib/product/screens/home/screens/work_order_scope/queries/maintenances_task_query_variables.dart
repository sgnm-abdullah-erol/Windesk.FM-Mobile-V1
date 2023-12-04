final class MaintenancesTaskVariableQueries {
  static Map<String, dynamic> getMaintenancesTaskVariables(String taskId) {
    return {
      "where": {
        "isDeleted": false,
        "id": int.parse(taskId),
      }
    };
  }

  static Map<String, dynamic> checkListValueVariables(int checkListValueId, int scopeId, String scopeLabel, int taskId) {
    return {
      "startCheckListValueInput": {
        "checkListId": checkListValueId,
        "scopeId": scopeId,
        "scopeLabel": scopeLabel,
        "taskId": taskId,
      }
    };
  }
}
