import 'package:flutter/material.dart';

import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/models/start_check_list_value_model.dart';

import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/provider/scope_provider.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/widgets/custom_scope_check_item_card.dart';

class AddCheckItemAcordion extends StatelessWidget {
  const AddCheckItemAcordion(
      {super.key, required this.provider, required this.taskId, required this.taskKey, this.checkListValueModel, this.maintanenceList});
  final ScopeProvider provider;
  final MaintanenceModel? maintanenceList;
  final StartCheckListValueModel? checkListValueModel;
  final String taskId;
  final String taskKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: maintanenceList?.scheduledBy?.first.parentSchedule?.first.checkList?.first.includesOfCheckItems?.length,
        itemBuilder: (context, index) {
          return CustomScopeCheckItemCard(
            checkItem: maintanenceList?.scheduledBy?.first.parentSchedule?.first.checkList?.first.includesOfCheckItems?[index],
            provider: provider,
            checkListValueId: checkListValueModel?.id,
          );
        },
      ),
    );
  }
}
