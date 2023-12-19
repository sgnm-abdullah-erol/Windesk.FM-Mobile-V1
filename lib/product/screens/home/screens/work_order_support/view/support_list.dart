import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vm_fm_4/core/constants/paths/service_tools.dart';
import 'package:vm_fm_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/check_list_maintanence_model.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';
import 'package:vm_fm_4/feature/models/work_order_support_models/support_model.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_support/graphql_result_handling.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_support/queries/maintenances_task_query_variables.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_support/view/support_card_list_screen.dart';
import '../queries/maintenances_task_queries.dart';

@RoutePage()
class SupportList extends StatelessWidget {
  SupportList({super.key, required this.taskId});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final String taskId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomMainAppbar(
          title: Text('${LocaleKeys.SupportList.tr()} - $taskId'),
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
                  final SupportModel supportModel =
                      _checkNullablitiyOfMaintenanceModel(
                          context, result.data ?? {});

                  return Query(
                    options: QueryOptions(
                      document: gql(MaintenancesTaskQuery.checkListValue),
                      variables:
                          MaintenancesTaskVariableQueries.getCheckListValue(
                              taskId.toString()),
                    ),
                    builder: GraphqlResultHandling.withGenericHandling(context,
                        (QueryResult result, {refetch, fetchMore}) {
                      final CheckListMaintanenceModel
                          checkListmaintanenceModel =
                          _checkNullablitiyOfCheckListMaintenanceModel(
                        context,
                        result.data ?? {},
                      );

                      // if (!_checkMaintenancePlan(context, maintanenceModel, checkListmaintanenceModel)) {
                      //   snackBar(context, LocaleKeys.EmptyComponentList.tr(), 'error');
                      //   //context.router.pop();
                      //   return Container();
                      // } else {
                      return SupportCardListScreen(
                        supportModel: supportModel,
                        checkListmaintanenceModel: checkListmaintanenceModel,
                        taskId: taskId,
                        refetchFunction: refetch,
                      );
                    }
                        //},
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

  bool _checkMaintenancePlan(BuildContext context, MaintanenceModel model,
      CheckListMaintanenceModel checkListmaintanenceModel) {
    bool goScopeList = true;

    if ((checkListmaintanenceModel.checkListValue?.isEmpty ?? false) ||
        (model.maintenancePlan?.isEmpty ?? false) ||
        (model.maintenancePlan?.first.components?.isEmpty ?? false)) {
      // cannot go to scope list
      goScopeList = false;
    } else {
      // can go to scope list
      goScopeList = true;
    }

    return goScopeList;
  }

  SupportModel _checkNullablitiyOfMaintenanceModel(
      BuildContext context, Map<String, dynamic> result) {
    print('Result' + result.toString());
    if (result['supports'] == null) {
      //_showSnackbar();
      //context.router.pop();
      return const SupportModel();
    } else {
      if (result['supports'].first != null) {
        return SupportModel.fromJson(result['supports'][0]);
      } else {
        //_showSnackbar();
        //context.router.pop();
        return const SupportModel();
      }
    }
  }

  CheckListMaintanenceModel _checkNullablitiyOfCheckListMaintenanceModel(
      BuildContext context, Map<String, dynamic> result) {
    print('Result2' + result.toString());

    if (result['supports'] == null) {
      // _showSnackbar();
      // context.router.pop();
      return const CheckListMaintanenceModel();
    } else {
      if (result['supports'].first != null) {
        return CheckListMaintanenceModel.fromJson(result['supports'][0]);
      } else {
        // _showSnackbar();
        // context.router.pop();
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
