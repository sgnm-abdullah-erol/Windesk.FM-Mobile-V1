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
            "SupportTask_ALL": {"id": taskId},
            "Component_ALL": {"id": scopeId},
          }
        ]
      }
    };
  }

  static Map<String, dynamic> checkListValueVariables(
      int checkListValueId, int scopeId, String scopeLabel, int taskId) {
    return {
      "startCheckListValueInput": {
        "checkListId": checkListValueId,
        "scopeId": scopeId,
        "scopeLabel": scopeLabel,
        "taskId": taskId,
      }
    };
  }

  static Map<String, dynamic> acceptRegulationMessageInput(
      int checkListValueId, int regulationId) {
    return {
      "acceptRegulationMessageInput": {
        "checkListValueId": checkListValueId,
        "regulationId": regulationId,
      }
    };
  }

  static Map<String, dynamic> createCheckItemValueInput(
      int checkItemId, int checkListValueId, String? inputValue) {
    return {
      "createCheckItemValueInput": {
        "checkItemId": checkItemId,
        "checkListValueId": checkListValueId,
        "inputValue": {"value": inputValue},
      }
    };
  }

  static Map<String, dynamic> submitChecklistValueEffortInput(
      int checkListValueId,
      String startDate,
      String endDate,
      String effortDuration,
      String effortType,
      String? description) {
    return {
      "submitChecklistValueEffortInput": [
        {
          "checkListValueId": checkListValueId,
          "startDate": startDate,
          "endDate": endDate,
          "effortDuration": effortDuration,
          "effortType": effortType,
          "description": description,
        }
      ]
    };
  }

  static Map<String, dynamic> updateCheckListValueStatusInput(
      int checkListValueId) {
    return {
      "updateCheckListValueStatusInput": {
        "checkListValueId": checkListValueId,
        "status": "Finished"
      }
    };
  }

  static Map<String, dynamic> checkListValues(int checkListValueId) {
    return {
      "where": {"id": checkListValueId}
    };
  }

  static Map<String, dynamic> getDocumentValues(
      int taskId, int checkListValueId) {
    return {
      "where": {
        "id": taskId,
      },
      "statusConnectionWhere2": {
        "edge": {"isDeleted": false}
      },
      "checkListValueWhere2": {"id": checkListValueId},
    };
  }
}
