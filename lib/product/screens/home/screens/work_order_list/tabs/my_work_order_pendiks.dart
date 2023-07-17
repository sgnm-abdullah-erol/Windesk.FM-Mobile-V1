import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
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
        : SizedBox(
            height: context.height,
            width: context.width,
            child: ListView.builder(
              itemCount: widget.provider.myWorkSpaceDetails.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomWoDetailCard(
                  workSpaceDetail: widget.provider.myWorkSpaceDetails[0],
                  isButtonVisible: true,
                  provider: widget.provider,
                ),
              ),
            ),
          );
  }
}
