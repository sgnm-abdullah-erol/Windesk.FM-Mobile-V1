import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/cards/custom_scope_list_card.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';

class ScopeBottomSheet extends StatelessWidget {
  const ScopeBottomSheet({super.key, required this.maintanenceModel, required this.taskId});

  final MaintanenceModel maintanenceModel;
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: context.height,
        width: context.width,
        child: ListView.builder(
          itemCount: maintanenceModel.maintenancePlan?.first.components?.first.willBeAppliedToComponents?.length,
          itemBuilder: (context, index) {
            final item = maintanenceModel.maintenancePlan?.first.components?.first.willBeAppliedToComponents?[index];
            return CustomScopeListCard(
              controlList: item?.componentOriginal?.properties?.className ?? '',
              name: item?.componentOriginal?.properties?.name ?? '',
              maintanenceModel: maintanenceModel,
            );
          },
        ),
      ),
    );
  }
}
