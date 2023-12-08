import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vm_fm_4/core/constants/other/app_icons.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/core/constants/paths/service_tools.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/graphql_result_handling.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/queries/maintenances_task_queries.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/queries/maintenances_task_query_variables.dart';

class SaveCheckListBottomSheet extends StatelessWidget {
  const SaveCheckListBottomSheet({super.key, required this.checkListValueId, this.maintanenceList});
  final MaintanenceModel? maintanenceList;
  final int checkListValueId;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLManager.getClient(HttpLink(ServiceTools.url.generalGraphql_url)),
      child: Query(
        options: QueryOptions(
          document: gql(MaintenancesTaskQuery.checkListValues),
          variables: MaintenancesTaskVariableQueries.checkListValues(checkListValueId),
        ),
        builder: GraphqlResultHandling.withGenericHandling(
          context,
          (QueryResult result, {refetch, fetchMore}) {
            if (result.data == null && !result.hasException) {
              return Text(LocaleKeys.FetchScopeListError.tr(), style: Theme.of(context).textTheme.bodyMedium);
            }
            final resultDataQuery = result.data?['checkListValues'].first['CheckItemValue'];
            return GraphQLProvider(
              client: GraphQLManager.getClientForMutation(context),
              child: Mutation(
                options: MutationOptions(
                  document: gql(MaintenancesTaskQuery.updateCheckListValueStatus),
                  update: (GraphQLDataProxy cache, QueryResult? result) {},
                  onCompleted: (dynamic resultData) async {
                    //koşul eklenmeli
                    snackBar(context, 'Scope Listesi Başarıyla Eklendi', 'success');
                    Navigator.of(context).pop<bool>(true);
                  },
                ),
                builder: (RunMutation runMutation, QueryResult? result) {
                  return SizedBox(
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(LocaleKeys.AreYouSureSaveCheckList.tr(), overflow: TextOverflow.fade),
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () => Navigator.of(context).pop<bool>(false),
                                style: ElevatedButton.styleFrom(backgroundColor: APPColors.Main.grey),
                                child: Icon(AppIcons.clear, color: APPColors.Main.white),
                              ),
                            ),
                            SizedBox(
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  final data = maintanenceList?.scheduledBy?.first.parentSchedule?.first.checkList?.first.includesOfCheckItems;
                                  bool allCheckListsTrue = false;
                                  for (var i = 0; i < data!.length; i++) {
                                    if (data[i].isRequired == true) {
                                      for (var b = 0; b < resultDataQuery!.length; b++) {
                                        if (resultDataQuery[b]['CheckItem'].first['id'] == data[i].id) {
                                          allCheckListsTrue = true;
                                          break;
                                        } else {
                                          allCheckListsTrue = false;
                                        }
                                      }
                                    }
                                  }
                                  allCheckListsTrue
                                      ? runMutation(
                                          MaintenancesTaskVariableQueries.updateCheckListValueStatusInput(
                                            checkListValueId,
                                          ),
                                        )
                                      : {snackBar(context, 'Scope Listesi Eklenemedi. Zorunlu alanları giriniz.', 'error'), context.router.pop()};
                                },
                                style: ElevatedButton.styleFrom(backgroundColor: APPColors.Main.green),
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
          },
        ),
      ),
    );
  }
}
