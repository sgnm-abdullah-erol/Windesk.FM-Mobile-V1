const String maintenancesTask = r'''
query MaintenancesTask($where: MaintenanceWhere)  {
    maintenances(where: $where) {
      id
      MaintenancePlan {
        Components {
          willBeAppliedToComponents {
            componentOriginal
          }
        }
        FacilityStructures {
          willBeAppliedToFacilityStructures {
            facilityStructureOriginal
          }
        }
        Systems {
          willBeAppliedToSystem {
            SystemOriginal
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

const String createCheckItemValue = r'''
mutation CreateCheckItemValue($createCheckItemValueInput: CreateCheckItemValueInput!) {
  createCheckItemValue(createCheckItemValueInput: $createCheckItemValueInput) {
    id
    key
  }
}
''';
