import 'dart:ffi';

final class MaintenancesTaskVariableQueries {
  static Map<String, dynamic> getMaintenancesTaskVariables(String taskId) {
    return {
      "where": {
        "isDeleted": false,
        "id": int.parse(taskId),
      }
    };
  }

  static Map<String, dynamic> getCheckListValue(String taskId) {
    return {
      "where": {
        "id": int.parse(taskId),
      },
      "statusConnectionWhere2": {
        "edge": {"isDeleted": false}
      },
    };
  }

  static Map<String, dynamic> getCheckListValue2(int taskId, int scopeId) {
    return {
      "where": {
        "AND": [
          {
            "MaintenanceTask_ALL": {"id": taskId},
            "Component_ALL": {"id": scopeId},
          }
        ]
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

  static Map<String, dynamic> acceptRegulationMessageInput(int checkListValueId, int regulationId) {
    return {
      "acceptRegulationMessageInput": {
        "checkListValueId": checkListValueId,
        "regulationId": regulationId,
      }
    };
  }

  static Map<String, dynamic> createCheckItemValueInput(int checkItemId, int checkListValueId, String? inputValue) {
    return {
      "createCheckItemValueInput": {
        "checkItemId": checkItemId,
        "checkListValueId": checkListValueId,
        "inputValue": inputValue,
      }
    };
  }
}
