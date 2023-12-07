import 'package:flutter/material.dart';

@immutable
final class MaintenancesTaskQuery {
  static const String checkListValue = r'''
  query CheckListValue($where: MaintenanceWhere, $statusConnectionWhere2: CheckListValueStatusConnectionWhere) {
    maintenances(where: $where) {
      CheckListValue {
        id
    Component{
      id
    }
    FacilityStructure{
      id
    }
    System{
      id
    }
        StatusConnection(where: $statusConnectionWhere2) {
          edges {
            node {
              code
            }
          }
        }
  
      }
  
    }
  }
  ''';

  static const String checkListValue2 = r'''
  query CheckListValues($where: CheckListValueWhere) {
    checkListValues(where: $where) {
      id
      labels
      key
    }
  }
  ''';
  static const String maintenancesTask = r'''
    query MaintenancesTask($where: MaintenanceWhere)  {
        maintenances(where: $where) {
          id
          MaintenancePlan {
            Components {
              willBeAppliedToComponents {
                componentOriginal
                id
              }
            }
            FacilityStructures {
              willBeAppliedToFacilityStructures {
                facilityStructureOriginal
                id
              }
            }
            Systems {
              willBeAppliedToSystem {
                SystemOriginal
                id
              }
            }
          }
          ScheduledBy {
            parentSchedule {
              CheckList {
                name
                id
                hasRegulations {
                  name
                  id
                  description
                }
                includesOfCheckItems {
                  id
                  name
                  inputType
                  labels
                  photoRequired
                  description
                  isRequired
                  documentRequired
                }
              }
            }
          }
        }
      }
      ''';

  static const String createCheckItemValue = r'''
    mutation CreateCheckItemValue($createCheckItemValueInput: CreateCheckItemValueInput!) {
      createCheckItemValue(createCheckItemValueInput: $createCheckItemValueInput) {
        id
        key
      }
    }
    ''';

  static const String startCheckListValueInput = r'''
    mutation StartCheckListValue($startCheckListValueInput: StartCheckListValueInput!) {
      startCheckListValue(startCheckListValueInput: $startCheckListValueInput) {
        id
        labels
      }
    }
    ''';

  static const String acceptRegulationMessage = r'''
    mutation AcceptRegulationMessage($acceptRegulationMessageInput: AcceptRegulationMessageInput!) {
      acceptRegulationMessage(acceptRegulationMessageInput: $acceptRegulationMessageInput) {
        id   
      }
    }
    ''';

  static const String submitChecklistValueEffort = r'''
    mutation SubmitChecklistValueEffort($submitChecklistValueEffortInput: [SubmitChecklistValueEffortInput!]!) {
      submitChecklistValueEffort(submitChecklistValueEffortInput: $submitChecklistValueEffortInput) {
        id
    
      }
    }
    ''';
}
