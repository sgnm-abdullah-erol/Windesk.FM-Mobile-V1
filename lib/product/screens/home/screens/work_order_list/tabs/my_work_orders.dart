import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/provider/work_order_list_provider.dart';

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
    return SizedBox(
      height: context.height,
      width: context.width,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
