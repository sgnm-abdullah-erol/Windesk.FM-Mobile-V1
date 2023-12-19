import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/check_list_maintanence_model.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';
import 'package:vm_fm_4/feature/models/work_order_support_models/support_model.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_support/widgets/custom_support_list_card.dart';

class SupportCardListScreen extends StatelessWidget {
  const SupportCardListScreen({
    super.key,
    this.checkListmaintanenceModel,
    required this.supportModel,
    required this.taskId,
    this.refetchFunction,
  });

  final SupportModel supportModel;
  final CheckListMaintanenceModel? checkListmaintanenceModel;
  final String taskId;
  final Function? refetchFunction;

  @override
  Widget build(BuildContext context) {
    print('SAY : ');
    print(supportModel.supportPlan);
    return SizedBox(
      height: context.height - 170,
      width: context.width,
      child: ListView.builder(
        itemCount: supportModel.supportPlan?.first.components?.first
            .willBeAppliedToComponents?.length,
        itemBuilder: (context, index) {
          final item = supportModel.supportPlan?.first.components?.first
              .willBeAppliedToComponents?[index];
          String? checkListSituation = '';
          var total = checkListmaintanenceModel?.checkListValue!.length ?? 0;
          if (checkListmaintanenceModel != null) {
            print('CHECK LİST MAN MODEL : ');
            print(checkListmaintanenceModel);
            for (var i = 0; i < total; i++) {
              if (checkListmaintanenceModel?.checkListValue?[i].component?[0]
                      ['id'] ==
                  item?.id) {
                print('GİRD KONTRO');
                checkListSituation = checkListmaintanenceModel
                    ?.checkListValue?[i].statusConnection?.edges?[0].node?.code;
              }
            }
          }

          print('SİTATİON : ');
          print(checkListSituation);
          
          return CustomSupportListCard(
            controlList: item?.componentOriginal?.properties?.className ?? '',
            name: item?.componentOriginal?.properties?.name ?? '',
            scopeId: item?.id ?? 0,
            supportModel: supportModel,
            checkListmaintanenceModel: checkListmaintanenceModel,
            checkListSituation: checkListSituation,
            refetch: refetchFunction,
          );
        },
      ),
    );
  }
}
