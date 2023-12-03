import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:vm_fm_4/feature/components/cards/custom_scope_check_item_card.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_model.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/provider/scope_provider.dart';

@RoutePage()
class ScopeDetail extends StatelessWidget {
  const ScopeDetail({super.key, this.maintanenceList});
  final MaintanenceModel? maintanenceList;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScopeProvider(),
      child: Scaffold(
        
          appBar: CustomMainAppbar(
            title: Text('Check Items - ${maintanenceList?.id.toString()}'),
            returnBack: true,
          ),
          body: Consumer<ScopeProvider>(builder: (context, ScopeProvider provider, child) {
            return SizedBox(
              child: ListView.builder(
                  itemCount: maintanenceList?.scheduledBy?[0].parentSchedule?[0].checkList?[0].includesOfCheckItems?.length,
                  itemBuilder: (context, index) {
                    return CustomScopeCheckItemCard(
                      checkItem: maintanenceList?.scheduledBy?[0].parentSchedule?[0].checkList?[0].includesOfCheckItems?[index],
                      provider: provider,
                    );
                  }),
            );
          })),
    );
  }
}
