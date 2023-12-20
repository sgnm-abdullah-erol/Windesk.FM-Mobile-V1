import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vm_fm_4/core/constants/other/app_icons.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/core/route/app_route.gr.dart';
import 'package:vm_fm_4/feature/models/work_order_support_models/support_model.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_support/models/start_check_list_value_model.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_support/queries/maintenances_task_queries.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_support/queries/maintenances_task_query_variables.dart';

class AlertCheckListBottomSheet extends StatelessWidget {
  const AlertCheckListBottomSheet(
      {super.key,
      required this.supportModel,
      required this.startCheckListValue});

  final SupportModel supportModel;
  final StartCheckListValueModel startCheckListValue;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLManager.getClientForMutation(context),
      child: Mutation(
        options: MutationOptions(
          document: gql(MaintenancesTaskQuery.acceptRegulationMessage),
          update: (GraphQLDataProxy cache, QueryResult? result) {},
          onCompleted: (dynamic resultData) async {
            context.router.push(SupportDetail(
                supportList: supportModel,
                checkListValueModel: startCheckListValue));
          },
        ),
        builder: (RunMutation runMutation, QueryResult? result) {
          return SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(supportModel.scheduledBy?.first.parentSchedule?.first
                        .checkList?.first.hasRegulations?.first.name ??
                    ''),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Flexible(
                    child: Text(
                      supportModel
                              .scheduledBy
                              ?.first
                              .parentSchedule
                              ?.first
                              .checkList
                              ?.first
                              .hasRegulations
                              ?.first
                              .description ??
                          '',
                      maxLines: 3,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop<bool>(false),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: APPColors.Main.grey),
                        child:
                            Icon(AppIcons.clear, color: APPColors.Main.white),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          runMutation(
                            MaintenancesTaskVariableQueries
                                .acceptRegulationMessageInput(
                              startCheckListValue.id ?? 0,
                              supportModel
                                      .scheduledBy
                                      ?.first
                                      .parentSchedule
                                      ?.first
                                      .checkList
                                      ?.first
                                      .hasRegulations
                                      ?.first
                                      .id ??
                                  0,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: APPColors.Main.green),
                        child: Icon(AppIcons.okay, color: APPColors.Main.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
