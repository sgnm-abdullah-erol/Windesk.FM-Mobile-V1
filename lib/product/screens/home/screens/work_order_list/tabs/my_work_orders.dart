import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:vm_fm_4/product/screens/home/screens/work_order_list/widgets/custom_loading_indicator.dart';
import '../../../../../../feature/components/cards/custom_wo_listl_card.dart';
import '../../../../../../feature/extensions/context_extension.dart';
import '../provider/work_order_list_provider.dart';

class MyWorkOrders extends StatefulWidget {
  const MyWorkOrders({super.key, required this.provider});

  final WorkOrderListProvider provider;

  @override
  State<MyWorkOrders> createState() => _MyWorkOrdersState();
}

class _MyWorkOrdersState extends State<MyWorkOrders> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget.provider.getMyWorkOrders();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.provider.isLoading
        ? const CustomLoadingIndicator()
        : SizedBox(
            height: context.height,
            width: context.width,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return CustomWoDetailCard(
                  onPressed: (woCode) {},
                  code: 'asda',
                  id: 'asda',
                  moduleLocation: 'asda',
                  name: 'asda',
                  plannedEndDate: 'asda',
                  service: 'asda',
                  responsible: 'asda',
                  serviceName: 'asda',
                  statusName: 'asda',
                );
              },
            ),
          );
  }
}
