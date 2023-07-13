import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/widgets/custom_loading_indicator.dart';

import '../../../../../../feature/components/cards/custom_wo_listl_card.dart';
import '../provider/work_order_list_provider.dart';

class MyWorkOrderPendiks extends StatefulWidget {
  const MyWorkOrderPendiks({super.key, required this.provider});

  final WorkOrderListProvider provider;

  @override
  State<MyWorkOrderPendiks> createState() => _MyWorkOrderPendiksState();
}

class _MyWorkOrderPendiksState extends State<MyWorkOrderPendiks> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget.provider.getMyPendikWorkOrders();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.provider.isLoading
        ? const CustomLoadingIndicator()
        : CustomWoDetailCard(
            onPressed: (woCode) {
              print(woCode);
            },
            code: 'asda',
            id: 'asda',
            moduleLocation: 'asda',
            name: 'asda',
            plannedEndDate: 'asda',
            service: 'asda',
            responsible: 'asda',
            serviceName: 'asda',
            statusName: 'asda',
            isButtonVisible: true,
          );
  }
}
