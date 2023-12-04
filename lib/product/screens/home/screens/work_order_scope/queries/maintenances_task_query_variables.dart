final class MaintenancesTaskVariableQueries {
  static Map<String, dynamic> getMaintenancesTaskVariables(String taskId) {
    return {
      "where": {
        "isDeleted": false,
        "id": int.parse(taskId),
      }
    };
  }
}
