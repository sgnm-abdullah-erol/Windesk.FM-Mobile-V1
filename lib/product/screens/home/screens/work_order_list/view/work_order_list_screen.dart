import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../../feature/components/loading/custom_appbar_loading.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
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
        builder: (context, WorkOrderListProvider provider, _) {
          return provider.isLoading
              ? const CustomAppbarLoading(
                  appBar: CustomMainAppbar(title: Text(AppStrings.workOrderList), returnBack: true, elevation: 3),
                )
              : _BuildScaffold(provider: provider);
        },
      ),
    );
  }
}

class _BuildScaffold extends StatelessWidget {
  const _BuildScaffold({required this.provider});

  final WorkOrderListProvider provider;

  final List<Widget> tabs = const [
    Text(AppStrings.myOrders),
    Text(AppStrings.myGroups),
    Text(AppStrings.myPendiks),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMainAppbar(title: Text(AppStrings.workOrderList), returnBack: true, elevation: 3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            CustomDefaultTabController(provider: provider, tabs: tabs),
            provider.tabIndex == 0
                ? MyWorkOrders(provider: provider)
                : provider.tabIndex == 1
                    ? MyGroupWorkOrders(provider: provider)
                    : MyWorkOrderPendiks(provider: provider),
          ],
        ),
      ),
    );
  }
}
