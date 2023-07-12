import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../../../feature/components/cards/custom_wo_detail_card.dart';
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
    return CustomWoDetailCard(
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
    );
  }
}
