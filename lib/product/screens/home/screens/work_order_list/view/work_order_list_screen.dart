import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/constants/other/app_icons.dart';
import 'package:vm_fm_4/product/screens/sla/widgets/custom_sla_timeline_dialog.dart';

import '../../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../provider/work_order_list_provider.dart';
import '../tabs/my_group_work_orders.dart';
import '../tabs/my_work_order_pendiks.dart';
import '../tabs/my_work_orders.dart';
import '../widgets/custom_default_tab_controller.dart';

@RoutePage()
class WorkOrderListScreen extends StatelessWidget {
  const WorkOrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkOrderListProvider(),
      child: Consumer(
        builder: (context, WorkOrderListProvider provider, _) => _BuildScaffold(provider: provider),
      ),
    );
  }
}

class _BuildScaffold extends StatelessWidget {
  _BuildScaffold({required this.provider});

  final WorkOrderListProvider provider;

  final List<Widget> tabs = [
    const Text(LocaleKeys.MyOrders, maxLines: 1, overflow: TextOverflow.ellipsis).tr(),
    const Text(LocaleKeys.MyGroups, maxLines: 1, overflow: TextOverflow.ellipsis).tr(),
    const Text(LocaleKeys.MyPendings, maxLines: 1, overflow: TextOverflow.ellipsis).tr(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainAppbar(
        title: Text(LocaleKeys.WorkOrderList.tr()),
        returnBack: true,
        elevation: 3,
        actions: _appBarActions(context, provider),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(flex: 10, child: CustomDefaultTabController(provider: provider, tabs: tabs)),
          Expanded(
            flex: 90,
            child: provider.tabIndex == 0
                ? MyWorkOrders(provider: provider)
                : provider.tabIndex == 1
                    ? MyGroupWorkOrders(provider: provider)
                    : MyWorkOrderPendiks(provider: provider),
          ),
        ],
      ),
    );
  }

  List<Widget> _appBarActions(BuildContext context, WorkOrderListProvider provider) {
    return provider.tabIndex == 0
        ? [
            IconButton(
              onPressed: () async {
                final response = await showDialog(
                  context: context,
                  builder: (context) => const CustomSlaTimeLineDialog(),
                );

                debugPrint(response);
              },
              icon: const Icon(AppIcons.filter),
            ),
          ]
        : [];
  }
}
