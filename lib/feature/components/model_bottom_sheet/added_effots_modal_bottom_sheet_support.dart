import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/core/constants/paths/service_tools.dart';
import 'package:vm_fm_4/core/constants/style/custom_paddings.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_support/queries/maintenances_task_queries.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_support/queries/maintenances_task_query_variables.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_support/graphql_result_handling.dart';

class AddedEffortsModalBottomSheetSupport extends StatelessWidget {
  const AddedEffortsModalBottomSheetSupport(
      {super.key, required this.taskId, required this.checkListValueId});

  final int taskId;
  final int checkListValueId;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLManager.getClient(
          HttpLink(ServiceTools.url.generalGraphql_url)),
      child: Query(
        options: QueryOptions(
          document: gql(MaintenancesTaskQuery.getEffortsQuery),
          variables: MaintenancesTaskVariableQueries.getDocumentValues(
              taskId, checkListValueId),
        ),
        builder: GraphqlResultHandling.withGenericHandling(
          context,
          (QueryResult result, {refetch, fetchMore}) {
            if (result.data == null && !result.hasException) {
              return Text(LocaleKeys.FetchScopeListError.tr(),
                  style: Theme.of(context).textTheme.bodyMedium);
            }
            final resultDataQuery = result
                .data?['supports'].first['CheckListValue'].first['Effort'];
            return SizedBox(
              height: context.height * 0.7,
              width: context.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: resultDataQuery.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: APPColors.Login.white,
                        elevation: 4,
                        child: Padding(
                          padding: CustomPaddings.pageNormal,
                          child: Column(
                            children: [
                              _columnChilds(context, resultDataQuery[index]),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            );
          },
        ),
      ),
    );
  }

  Column _columnChilds(BuildContext context, dynamic queryItem) {
    return Column(
      children: [
        _titleAndLabel(
            context, LocaleKeys.Description.tr(), queryItem['description']),
        _emptyDivider(),
        _titleAndLabel(
            context, LocaleKeys.TotalTime.tr(), queryItem['effortDuration']),
        _emptyDivider(),
        _titleAndLabel(
            context, LocaleKeys.StartDate.tr(), queryItem['startDate']),
        _emptyDivider(),
        _titleAndLabel(
          context,
          LocaleKeys.EndDate.tr(),
          queryItem['endDate'],
        ),
        _emptyDivider(),
        _titleAndLabel(
          context,
          LocaleKeys.EffortType.tr(),
          queryItem['effortType'],
        ),
        _emptyDivider(),
      ],
    );
  }

  Column _emptyDivider() {
    return Column(
      children: [
        const SizedBox(height: 5),
        Divider(height: 1, color: APPColors.Main.grey),
        const SizedBox(height: 10),
      ],
    );
  }

  Row _titleAndLabel(BuildContext context, String title, String label) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(title,
              style: context.bodyMedium.copyWith(
                  color: APPColors.Main.black, overflow: TextOverflow.fade)),
        ),
        Expanded(
          flex: 3,
          child: Text(label,
              style: context.bodySmall.copyWith(
                  color: APPColors.Main.black, overflow: TextOverflow.fade)),
        ),
      ],
    );
  }
}
