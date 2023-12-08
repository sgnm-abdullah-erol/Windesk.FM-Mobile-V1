import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vm_fm_4/core/constants/paths/service_tools.dart';
import 'package:vm_fm_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
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
      appBar: CustomMainAppbar(title: Text('${LocaleKeys.ScopeList.tr()} - $taskId'), returnBack: true),
      body: GraphQLProvider(
        client: GraphQLManager.getClient(HttpLink(ServiceTools.url.generalGraphql_url)),
        child: Column(
          children: [
            Query(
              options: QueryOptions(
                document: gql(MaintenancesTaskQuery.maintenancesTask),
                variables: MaintenancesTaskVariableQueries.getMaintenancesTaskVariables(taskId.toString()),
              ),
              builder: GraphqlResultHandling.withGenericHandling(
                context,
                (QueryResult result, {refetch, fetchMore}) {
                  if (result.data == null && !result.hasException) {
                    return Text(LocaleKeys.FetchScopeListError.tr(), style: Theme.of(context).textTheme.bodyMedium);
                  }
                  final MaintanenceModel maintanenceModel = _checkNullablitiyOfMaintenanceModel(context, result.data ?? {});

                  return Query(
                    options: QueryOptions(
                      document: gql(MaintenancesTaskQuery.checkListValue),
                      variables: MaintenancesTaskVariableQueries.getCheckListValue(taskId.toString()),
                    ),
                    builder: GraphqlResultHandling.withGenericHandling(
                      context,
                      (QueryResult result, {refetch, fetchMore}) {
                        if (result.data == null && !result.hasException) {
                          return Text(LocaleKeys.FetchScopeListError.tr(), style: Theme.of(context).textTheme.bodyMedium);
                        }
                        final CheckListMaintanenceModel checkListmaintanenceModel = _checkNullablitiyOfCheckListMaintenanceModel(
                          context,
                          result.data ?? {},
                        );

                        if (!_checkMaintenancePlan(context, maintanenceModel)) {
                          snackBar(context, LocaleKeys.EmptyComponentList.tr(), 'error');
                          context.router.pop();
                          return Container();
                        } else {
                          return ScopeCardListScreen(
                            maintanenceModel: maintanenceModel,
                            checkListmaintanenceModel: checkListmaintanenceModel,
                            taskId: taskId,
                          );
                        }
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

  bool _checkMaintenancePlan(BuildContext context, MaintanenceModel model) {
    bool goScopeList = true;

    if (model.maintenancePlan?.isEmpty ?? false) {
      // cannot go to scope list
      goScopeList = false;
    } else {
      // can go to scope list
      goScopeList = true;
    }

    return goScopeList;
  }

  MaintanenceModel _checkNullablitiyOfMaintenanceModel(BuildContext context, Map<String, dynamic> result) {
    if (result['maintenances'] == null) {
      _showSnackbar();
      context.router.pop();
      return const MaintanenceModel();
    } else {
      if (result['maintenances'].first != null) {
        return MaintanenceModel.fromJson(result['maintenances'][0]);
      } else {
        _showSnackbar();
        context.router.pop();
        return const MaintanenceModel();
      }
    }
  }

  CheckListMaintanenceModel _checkNullablitiyOfCheckListMaintenanceModel(BuildContext context, Map<String, dynamic> result) {
    if (result['maintenances'] == null) {
      _showSnackbar();
      context.router.pop();
      return const CheckListMaintanenceModel();
    } else {
      if (result['maintenances'].first != null) {
        return CheckListMaintanenceModel.fromJson(result['maintenances'][0]);
      } else {
        _showSnackbar();
        context.router.pop();
        return const CheckListMaintanenceModel();
      }
    }
  }

  ScaffoldFeatureController _showSnackbar() {
    return ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(LocaleKeys.FetchScopeListError.tr()),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
