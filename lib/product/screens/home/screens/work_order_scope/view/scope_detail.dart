import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:vm_fm_4/feature/components/cards/custom_scope_check_item_card.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/provider/scope_provider.dart';

@RoutePage()
class ScopeDetail extends StatelessWidget {
  const ScopeDetail({super.key, this.maintanenceList, this.checkListValueId});
  final MaintanenceModel? maintanenceList;
  final int? checkListValueId;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScopeProvider(),
      child: Scaffold(
        appBar: CustomMainAppbar(
          title: Text('${LocaleKeys.CheckList.tr()} - ${maintanenceList?.id.toString()}'),
          returnBack: true,
        ),
        body: Consumer<ScopeProvider>(
          builder: (context, ScopeProvider provider, child) {
            return SizedBox(
              child: ListView.builder(
                itemCount: maintanenceList?.scheduledBy?.first.parentSchedule?.first.checkList?.first.includesOfCheckItems?.length,
                itemBuilder: (context, index) {
                  return CustomScopeCheckItemCard(
                    checkItem: maintanenceList?.scheduledBy?.first.parentSchedule?.first.checkList?.first.includesOfCheckItems?[index],
                    provider: provider,
                    checkListValueId: checkListValueId,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
