import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/check_list_maintanence_model.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/widgets/custom_scope_list_card.dart';

class ScopeCardListScreen extends StatelessWidget {
  const ScopeCardListScreen({
    super.key,
    this.checkListmaintanenceModel,
    required this.maintanenceModel,
    required this.taskId,
    this.refetchFunction,
  });

  final MaintanenceModel maintanenceModel;
  final CheckListMaintanenceModel? checkListmaintanenceModel;
  final String taskId;
  final Function? refetchFunction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height - 200,
      width: context.width,
      child: ListView.builder(
        itemCount: maintanenceModel.maintenancePlan?.first.components?.first.willBeAppliedToComponents?.length,
        itemBuilder: (context, index) {
          final item = maintanenceModel.maintenancePlan?.first.components?.first.willBeAppliedToComponents?[index];
          String? checkListSituation = '';
          var total = checkListmaintanenceModel?.checkListValue!.length ?? 0;
          if (checkListmaintanenceModel != null) {
            for (var i = 0; i < total; i++) {
              if (checkListmaintanenceModel?.checkListValue?[i].component?[0]['id'] == item?.id) {
                checkListSituation = checkListmaintanenceModel?.checkListValue?[i].statusConnection?.edges?[0].node?.code;
              }
            }
          }
          return CustomScopeListCard(
            controlList: item?.componentOriginal?.properties?.className ?? '',
            name: item?.componentOriginal?.properties?.name ?? '',
            scopeId: item?.id ?? 0,
            maintanenceModel: maintanenceModel,
            checkListmaintanenceModel: checkListmaintanenceModel,
            checkListSituation: checkListSituation,
            refetchFunction: refetchFunction,
          );
        },
      ),
    );
  }
}
