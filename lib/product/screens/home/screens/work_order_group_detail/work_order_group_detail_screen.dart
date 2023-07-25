import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/loading/custom_main_loading.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_group_detail/work_order_group_detail_provider.dart';

@RoutePage()
class WorkOrderGroupDetailScreen extends StatelessWidget {
  const WorkOrderGroupDetailScreen({super.key, required this.requestCode});

  final String requestCode;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkOrderGroupDetailProvider(),
      child: Consumer<WorkOrderGroupDetailProvider>(
        builder: (context, provider, child) {
          provider.isGroupWorkOrdersDataFetched ? null : provider.getGroupSpaceOrders(requestCode);
          return provider.isLoading ? const CustomMainLoading() : const Scaffold();
        },
      ),
    );
  }
}
