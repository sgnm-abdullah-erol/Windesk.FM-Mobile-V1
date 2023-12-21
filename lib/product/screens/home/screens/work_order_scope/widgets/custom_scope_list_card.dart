import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vm_fm_4/core/constants/other/app_icons.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/core/constants/paths/service_tools.dart';
import 'package:vm_fm_4/core/constants/style/custom_paddings.dart';
import 'package:vm_fm_4/core/route/app_route.gr.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_elevated_button_with_icon.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/check_list_maintanence_model.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/graphql_result_handling.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/models/start_check_list_value_model.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/queries/maintenances_task_queries.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/queries/maintenances_task_query_variables.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/widgets/alert_check_list_bottom_sheet.dart';

class CustomScopeListCard extends StatelessWidget {
  const CustomScopeListCard({
    super.key,
    required this.name,
    required this.controlList,
    required this.scopeId,
    this.startDate,
    this.technician,
    this.onTap,
    this.maintanenceModel,
    this.checkListmaintanenceModel,
    this.checkListSituation,
    this.refetchFunction,
  });

  final String name;
  final String controlList;
  final int scopeId;
  final String? startDate;
  final String? technician;
  final Function? onTap;
  final MaintanenceModel? maintanenceModel;
  final CheckListMaintanenceModel? checkListmaintanenceModel;
  final dynamic checkListSituation;
  final Function? refetchFunction;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLManager.getClientForMutation(context),
      child: Mutation(
        options: MutationOptions(
          document: gql(MaintenancesTaskQuery.startCheckListValueInput),
          update: (GraphQLDataProxy cache, QueryResult? result) {},
          onCompleted: (Map<String, dynamic>? resultData) async {
            StartCheckListValueModel? model = _setStartCheckListValue(resultData);
            if (model != null) {
              final response = await _bottomSheet(context, model);
              response ? refetchFunction!() : null;
            } else {
              snackBar(context, LocaleKeys.FetchScopeListError, 'error');
            }
          },
        ),
        builder: (RunMutation runMutation, QueryResult? result) {
          return Padding(
            padding: CustomPaddings.pageNormal,
            child: Card(
              color: APPColors.Login.white,
              elevation: 4,
              child: Padding(
                padding: CustomPaddings.pageNormal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _columnChilds(context),
                    checkListSituation == 'Started' || checkListSituation == 'Finished'
                        ? _continueButton(context, runMutation, checkListSituation)
                        : _startButton(context, runMutation),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Align _startButton(BuildContext context, RunMutation<dynamic> runMutation) {
    return Align(
      alignment: Alignment.center,
      child: CustomElevatedButtonWithIcon(
        bgColor: APPColors.Accent.black,
        icon: AppIcons.send,
        onPressFunction: () async {
          final component = maintanenceModel?.maintenancePlan?.first.components?.first.willBeAppliedToComponents?.first;

          runMutation(
            MaintenancesTaskVariableQueries.checkListValueVariables(
              maintanenceModel?.scheduledBy?.first.parentSchedule?.first.checkList?.first.id ?? 0,
              scopeId,
              component?.componentOriginal?.labels?[0] ?? '',
              maintanenceModel?.id ?? 0,
            ),
          );
        },
        iconColor: APPColors.Main.white,
        textValue: LocaleKeys.Start.tr(),
        textColor: APPColors.Main.white,
      ),
    );
  }

  GraphQLProvider _continueButton(BuildContext context, RunMutation<dynamic> runMutation, String checkListSituation) {
    return GraphQLProvider(
      client: GraphQLManager.getClient(HttpLink(ServiceTools.url.generalGraphql_url)),
      child: Query(
        options: QueryOptions(
          document: gql(MaintenancesTaskQuery.checkListValue2),
          variables: MaintenancesTaskVariableQueries.getCheckListValue2(maintanenceModel?.id ?? 0, scopeId),
        ),
        builder: GraphqlResultHandling.withGenericHandling(
          context,
          (QueryResult result, {refetch, fetchMore}) {
            if (result.data == null && !result.hasException) {
              return Text(LocaleKeys.FetchScopeListError.tr(), style: Theme.of(context).textTheme.bodyMedium);
            }
            final StartCheckListValueModel? checkListValue = _setCheckListValue(result.data);

            return Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  CustomElevatedButtonWithIcon(
                    bgColor: APPColors.Accent.black,
                    icon: checkListSituation == 'Finished' ? AppIcons.eventList : AppIcons.send,
                    onPressFunction: () async {
                      final result = await context.router.push(
                        ScopeDetail(
                          maintanenceList: maintanenceModel,
                          checkListValueModel: checkListValue,
                          checkListSituation: checkListSituation,
                        ),
                      );
                      //* if result is true, refetch the query
                      if (result == true) {
                        refetchFunction!();
                      }
                    },
                    iconColor: APPColors.Main.white,
                    textValue: checkListSituation == 'Finished' ? LocaleKeys.Browse.tr() : LocaleKeys.Contuniue.tr(),
                    textColor: APPColors.Main.white,
                  ),
                  checkListSituation == 'Finished'
                      ? Text(LocaleKeys.CompletedChecklist.tr(), style: TextStyle(color: APPColors.Main.red, fontSize: 10))
                      : Container()
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Column _columnChilds(BuildContext context) {
    return Column(
      children: [
        _titleAndLabel(context, LocaleKeys.Name.tr(), name),
        _emptyDivider(),
        _titleAndLabel(context, LocaleKeys.ControlList.tr(), controlList),
        _emptyDivider(),
        _titleAndLabel(
          context,
          LocaleKeys.Date.tr(),
          maintanenceModel?.maintenancePlan?.first.components?.first.willBeAppliedToComponents?.first.componentOriginal?.properties?.createdAt
                  .toString() ??
              '',
        ),
        _emptyDivider(),
        _titleAndLabel(
          context,
          LocaleKeys.Technician.tr(),
          maintanenceModel?.maintenancePlan?.first.components?.first.willBeAppliedToComponents?.first.componentOriginal?.properties?.name ?? '',
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

  Future<dynamic> _bottomSheet(BuildContext context, StartCheckListValueModel startCheckListValue) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => AlertCheckListBottomSheet(
        maintanenceModel: maintanenceModel ?? const MaintanenceModel(),
        startCheckListValue: startCheckListValue,
      ),
    );
  }

  Row _titleAndLabel(BuildContext context, String title, String label) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(title, style: context.bodyMedium.copyWith(color: APPColors.Main.black, overflow: TextOverflow.fade)),
        ),
        Expanded(
          flex: 2,
          child: Text(label, style: context.bodySmall.copyWith(color: APPColors.Main.black, overflow: TextOverflow.fade)),
        ),
      ],
    );
  }

  StartCheckListValueModel? _setStartCheckListValue(Map<String, dynamic>? data) {
    if (data != null || data?['startCheckListValue'] != null) {
      final checkListData = data?['startCheckListValue'];
      StartCheckListValueModel model = StartCheckListValueModel.fromJson(checkListData);
      return model;
    }
    return null;
  }

  StartCheckListValueModel? _setCheckListValue(Map<String, dynamic>? data) {
    if (data != null || data?['checkListValues'] != null) {
      final checkListData = data?['checkListValues'][0];
      StartCheckListValueModel model = StartCheckListValueModel.fromJson(checkListData);
      return model;
    }
    return null;
  }
}
