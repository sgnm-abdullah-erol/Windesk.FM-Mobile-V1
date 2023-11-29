import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/cards/custom_scope_list_card.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';

class ScopeBottomSheet extends StatelessWidget {
  ScopeBottomSheet({super.key, required this.maintanenceModel});

  MaintanenceModel maintanenceModel;
  @override
  Widget build(BuildContext context) {
    //List<WillBeAppliedToComponentModel> componentOriginals = WillBeAppliedToComponentModel.fromJsonList(maintanenceModel.maintenancePlan?[0].components?[0].willBeAppliedToComponents ?? ['']);

    return SingleChildScrollView(
      child: SizedBox(
        height: context.height,
        width: context.width,
        child: ListView.builder(
            itemCount: maintanenceModel.maintenancePlan?[0].components?[0].willBeAppliedToComponents?.length,
            itemBuilder: (context, index) {
              return CustomScopeListCard(
              controlList: maintanenceModel.maintenancePlan?[0].components?[0].willBeAppliedToComponents?[index].componentOriginal?.properties?.className ?? '',
              name: maintanenceModel.maintenancePlan?[0].components?[0].willBeAppliedToComponents?[index].componentOriginal?.properties?.name ?? '');
            }),
      ),
    );
  }
}
