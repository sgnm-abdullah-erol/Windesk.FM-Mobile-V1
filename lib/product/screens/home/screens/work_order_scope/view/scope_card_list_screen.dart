import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/widgets/custom_scope_list_card.dart';

class ScopeCardListScreen extends StatelessWidget {
  const ScopeCardListScreen({super.key, required this.maintanenceModel, required this.taskId});

  final MaintanenceModel maintanenceModel;
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 4 / 5,
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
    );
  }
}
