import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../provider/work_order_list_provider.dart';

class MyGroupWorkOrders extends StatefulWidget {
  const MyGroupWorkOrders({super.key, required this.provider});

  final WorkOrderListProvider provider;

  @override
  State<MyGroupWorkOrders> createState() => _MyGroupWorkOrdersState();
}

class _MyGroupWorkOrdersState extends State<MyGroupWorkOrders> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget.provider.getMyGroupWorkOrders();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
