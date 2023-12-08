import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vm_fm_4/core/constants/other/app_icons.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/queries/maintenances_task_queries.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/queries/maintenances_task_query_variables.dart';

class SaveCheckListBottomSheet extends StatelessWidget {
  const SaveCheckListBottomSheet({super.key, required this.checkListValueId});

  final int checkListValueId;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLManager.getClientForMutation(context),
      child: Mutation(
        options: MutationOptions(
          document: gql(MaintenancesTaskQuery.updateCheckListValueStatus),
          update: (GraphQLDataProxy cache, QueryResult? result) {},
          onCompleted: (dynamic resultData) async {
            //koşul eklenmeli
            print('resultData');
            print(resultData);
            snackBar(context, 'Scope Listesi Başarıyla Eklendi', 'success');
            context.router.pop();
          },
        ),
        builder: (RunMutation runMutation, QueryResult? result) {
          return SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(LocaleKeys.AreYouSureSaveCheckList.tr()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(backgroundColor: APPColors.Main.grey),
                        child: Icon(AppIcons.clear, color: APPColors.Main.white),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          runMutation(
                            MaintenancesTaskVariableQueries.updateCheckListValueStatusInput(
                              checkListValueId,
                            ),
                          );
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
  }
}
