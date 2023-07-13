import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../widgets/custom_loading_indicator.dart';
import '../../../../../../feature/components/cards/custom_wo_listl_card.dart';
import '../../../../../../feature/extensions/context_extension.dart';
import '../provider/work_order_list_provider.dart';

@RoutePage()
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
              itemCount: widget.provider.myWorkSpaceDetails.length,
              itemBuilder: (context, index) {
                return CustomWoDetailCard(
                  workSpaceDetail: widget.provider.myWorkSpaceDetails[index],
                  isButtonVisible: false,
                  provider: widget.provider,
                );
              },
            ),
          );
  }
}
