import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
    return const Placeholder();
  }
}
