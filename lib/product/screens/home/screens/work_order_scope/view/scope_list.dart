import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vm_fm_4/core/constants/paths/service_tools.dart';
import 'package:vm_fm_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:vm_fm_4/feature/components/snackbar/snackbar.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/check_list_maintanence_model.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/graphql_result_handling.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/queries/maintenances_task_query_variables.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/view/scope_card_list_screen.dart';
import '../queries/maintenances_task_queries.dart';

@RoutePage()
class ScopeList extends StatelessWidget {
  ScopeList({super.key, required this.taskId});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final String taskId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomMainAppbar(
          title: Text('${LocaleKeys.ScopeList.tr()} - $taskId'),
          returnBack: true),
      body: GraphQLProvider(
        client: GraphQLManager.getClient(
            HttpLink(ServiceTools.url.generalGraphql_url)),
        child: Column(
          children: [
            Query(
              options: QueryOptions(
                document: gql(MaintenancesTaskQuery.maintenancesTask),
                variables: MaintenancesTaskVariableQueries
                    .getMaintenancesTaskVariables(taskId.toString()),
              ),
              builder: GraphqlResultHandling.withGenericHandling(
                context,
                (QueryResult result, {refetch, fetchMore}) {
                  if (result.data == null && !result.hasException) {
                    return Text(LocaleKeys.FetchScopeListError.tr(),
                        style: Theme.of(context).textTheme.bodyMedium);
                  }

                  final MaintanenceModel? maintanenceModel =
                      _checkNullablitiyOfMaintenanceModel(
                          context, result.data ?? {});

                  return Query(
                    options: QueryOptions(
                      document: gql(MaintenancesTaskQuery.checkListValue),
                      variables:
                          MaintenancesTaskVariableQueries.getCheckListValue(
                              taskId.toString()),
                    ),
                    builder: GraphqlResultHandling.withGenericHandling(
                      context,
                      (QueryResult result, {refetch, fetchMore}) {
                        final CheckListMaintanenceModel?
                            checkListmaintanenceModel =
                            _checkNullablitiyOfCheckListMaintenanceModel(
                          context,
                          result.data ?? {},
                        );

                        if (maintanenceModel == null ||
                            checkListmaintanenceModel == null) {
                          _showSnackbar(context);
                          context.router.pop();
                          return Container();
                        }

                        return ScopeCardListScreen(
                          maintanenceModel: maintanenceModel,
                          checkListmaintanenceModel: checkListmaintanenceModel,
                          taskId: taskId,
                          refetchFunction: refetch,
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  MaintanenceModel? _checkNullablitiyOfMaintenanceModel(
      BuildContext context, Map<String, dynamic> result) {
    final model = MaintanenceModel.fromJson(result['maintenances'][0]);

    if (model.maintenancePlan == null ||
        model.maintenancePlan!.isEmpty ||
        model.maintenancePlan!.first.components == null ||
        model.maintenancePlan!.first.components!.isEmpty) {
      return null;
    } else {
      return MaintanenceModel.fromJson(result['maintenances'][0]);
    }
  }

  CheckListMaintanenceModel? _checkNullablitiyOfCheckListMaintenanceModel(
      BuildContext context, Map<String, dynamic> result) {
    final model = CheckListMaintanenceModel.fromJson(result['maintenances'][0]);

    if (model.checkListValue == null || model.checkListValue!.isEmpty) {
      return null;
    } else {
      return CheckListMaintanenceModel.fromJson(result['maintenances'][0]);
    }
  }

  void _showSnackbar(BuildContext context) {
    snackBar(context, LocaleKeys.EmptyComponentList.tr(), 'error');
  }
}
