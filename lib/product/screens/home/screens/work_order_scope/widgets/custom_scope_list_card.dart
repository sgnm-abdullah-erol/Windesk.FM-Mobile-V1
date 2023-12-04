import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vm_fm_4/core/constants/other/app_icons.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/core/constants/style/custom_paddings.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_elevated_button_with_icon.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';
import 'package:vm_fm_4/feature/service/graphql_manager.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/models/start_check_list_value_model.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/queries/maintenances_task_queries.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/queries/maintenances_task_query_variables.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/widgets/alert_check_list_bottom_sheet.dart';

class CustomScopeListCard extends StatelessWidget {
  const CustomScopeListCard({
    super.key,
    required this.name,
    required this.controlList,
    this.startDate,
    this.technician,
    this.onTap,
    this.maintanenceModel,
  });

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
          document: gql(MaintenancesTaskQuery.startCheckListValueInput),
          update: (GraphQLDataProxy cache, QueryResult? result) {},
          onCompleted: (Map<String, dynamic>? resultData) async {
            StartCheckListValueModel? model = _setStartCheckListValue(resultData);
            if (model != null) {
              await _bottomSheet(context, model.id ?? 0);
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
                    _contuinueButton(context, runMutation),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Align _contuinueButton(BuildContext context, RunMutation<dynamic> runMutation) {
    return Align(
      alignment: Alignment.center,
      child: CustomElevatedButtonWithIcon(
        bgColor: APPColors.Accent.black,
        icon: AppIcons.send,
        onPressFunction: () async {
          final component = maintanenceModel?.maintenancePlan?.first.components?.first.willBeAppliedToComponents?.first.componentOriginal;
          runMutation(
            MaintenancesTaskVariableQueries.checkListValueVariables(
              maintanenceModel?.scheduledBy?.first.parentSchedule?.first.checkList?.first.id ?? 0,
              component?.identity?.low ?? 0,
              component?.labels?.first ?? '',
              maintanenceModel?.id ?? 0,
            ),
          );
        },
        iconColor: APPColors.Main.white,
        textValue: LocaleKeys.Contuniue.tr(),
        textColor: APPColors.Main.white,
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

  Future<dynamic> _bottomSheet(BuildContext context, int checkListValueId) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => AlertCheckListBottomSheet(
        maintanenceModel: maintanenceModel ?? const MaintanenceModel(),
        checkListValueId: checkListValueId,
      ),
    );
  }

  Row _titleAndLabel(BuildContext context, String title, String label) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, maxLines: 1, style: context.bodyMedium.copyWith(color: APPColors.Main.black)),
        Text(label, maxLines: 1, style: context.bodySmall.copyWith(color: APPColors.Main.black)),
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
}
