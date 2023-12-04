import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vm_fm_4/core/constants/other/app_icons.dart';
import 'package:vm_fm_4/core/route/app_route.gr.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_circle_with_icon_button.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_elevated_button_with_icon.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

import '../../../core/constants/other/colors.dart';
import '../../extensions/context_extension.dart';
import '../../../product/screens/home/screens/work_order_scope/queries/scope/maintenances_task.dart' as queries;

class CustomScopeListCard extends StatelessWidget {
  const CustomScopeListCard(
      {super.key, required this.name, required this.controlList, this.startDate, this.technician, this.onTap, this.maintanenceModel});

  final String name;
  final String controlList;
  final String? startDate;
  final String? technician;
  final Function? onTap;
  final MaintanenceModel? maintanenceModel;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLManager.getClientForMutation(context),
      child: Mutation(
          options: MutationOptions(
            document: gql(queries.startCheckListValueInput), // this is the mutation string you just created
            // you can update the cache based on results
            // or do something with the result.data on completion
            update: (GraphQLDataProxy cache, QueryResult? result) {},
            onCompleted: (dynamic resultData) async {
              // ignore: avoid_print
              print(resultData['startCheckListValue']['id']);
              // ignore: unused_local_variable
              final result = await _bottomSheet(context, resultData['startCheckListValue']['id']);
              //if (result != '') {
              // workSpaceDetail.task?.requestedSpaces?.name = result ?? '';
              // // ignore: use_build_context_synchronously
              // context.router.popAndPush(DetailWorkOrderScreen(workSpaceDetail: workSpaceDetail));
              //}
              //print('resultdataaaaa' + resultData);
            },
          ),
          builder: (
            RunMutation runMutation,
            QueryResult? result,
          ) {
            return InkWell(
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                  child: Container(
                    height: context.height / 3,
                    decoration: BoxDecoration(
                      color: APPColors.Main.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: APPColors.Main.grey, blurRadius: 2, offset: const Offset(0, 4))],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _titleAndLabel(context, LocaleKeys.name, name),
                          _titleAndLabel(context, LocaleKeys.controlList, controlList),
                          _titleAndLabel(context, LocaleKeys.startDate, ''),
                          _titleAndLabel(context, LocaleKeys.technician, ''),
                          Align(
                              alignment: Alignment.center,
                              child: CustomElevatedButtonWithIcon(
                                bgColor: APPColors.Accent.black,
                                icon: AppIcons.send,
                                onPressFunction: () async {
                                  runMutation({
                                    "startCheckListValueInput": {
                                      "checkListId": maintanenceModel?.scheduledBy?[0].parentSchedule?[0].checkList?[0].id,
                                      "scopeId": maintanenceModel
                                          ?.maintenancePlan?[0].components?[0].willBeAppliedToComponents?[0].componentOriginal?.identity?.low,
                                      "scopeLabel": maintanenceModel
                                          ?.maintenancePlan?[0].components?[0].willBeAppliedToComponents?[0].componentOriginal?.labels?[0],
                                      "taskId": maintanenceModel?.id
                                    }
                                  });
                                  //final result = await _bottomSheet(context);
                                  // if (result != '') {
                                  //   // workSpaceDetail.task?.requestedSpaces?.name = result ?? '';
                                  //   // // ignore: use_build_context_synchronously
                                  //   // context.router.popAndPush(DetailWorkOrderScreen(workSpaceDetail: workSpaceDetail));
                                  // }
                                },
                                iconColor: Colors.white,
                                textValue: 'Devam Et',
                                textColor: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Future<dynamic> _bottomSheet(BuildContext context, int checkListValueId) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => GraphQLProvider(
        client: GraphQLManager.getClientForMutation(context),
        child: Mutation(
            options: MutationOptions(
              document: gql(queries.acceptRegulationMessage), // this is the mutation string you just created
              // you can update the cache based on results
              // or do something with the result.data on completion
              update: (GraphQLDataProxy cache, QueryResult? result) {},
              onCompleted: (dynamic resultData) async {
                debugPrint('asd$checkListValueId');

                context.router.push(ScopeDetail(maintanenceList: maintanenceModel, checkListValueId: checkListValueId));
                debugPrint(resultData);
              },
            ),
            builder: (
              RunMutation runMutation,
              QueryResult? result,
            ) {
              return SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(maintanenceModel?.scheduledBy?[0].parentSchedule?[0].checkList?[0].hasRegulations?[0].name ?? ''),
                    Text(maintanenceModel?.scheduledBy?[0].parentSchedule?[0].checkList?[0].hasRegulations?[0].description ?? ''),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomCircleWithIconButton(
                          bgColor: APPColors.Main.grey,
                          icon: AppIcons.clear,
                          onPressFunction: () => Navigator.pop(context),
                          iconColor: Colors.white,
                        ),
                        CustomCircleWithIconButton(
                          bgColor: APPColors.Main.green,
                          icon: AppIcons.okay,
                          onPressFunction: () {
                            runMutation({
                              "acceptRegulationMessageInput": {
                                "checkListValueId": checkListValueId,
                                "regulationId": maintanenceModel?.scheduledBy?[0].parentSchedule?[0].checkList?[0].hasRegulations?[0].id
                              }
                            });
                          },
                          iconColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Expanded _titleAndLabel(BuildContext context, String title, String label) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              maxLines: 1,
              style: context.titleSmall.copyWith(color: APPColors.Main.black),
            ),
          ),
          const SizedBox(),
          Expanded(
            flex: 4,
            child: Text(
              label,
              maxLines: 1,
              style: context.labelMedium.copyWith(color: APPColors.Main.black),
            ),
          ),
        ],
      ),
    );
  }
}
