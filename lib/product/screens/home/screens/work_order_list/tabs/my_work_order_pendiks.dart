import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../../../feature/extensions/context_extension.dart';
import '../../../../../../feature/route/app_route.gr.dart';
import '../provider/work_order_list_provider.dart';
import '../widgets/custom_loading_indicator.dart';
import '../widgets/custom_pendinks_card.dart';

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
              itemCount: widget.provider.myPendikWorkSpaceDetails.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    context.router
                        .push(PendingDetailWorkOrderScreen(workSpacePendiks: widget.provider.myPendikWorkSpaceDetails[index]))
                        .then((value) {
                      if (true) {
                        widget.provider.getMyPendikWorkOrders();
                      }
                    });
                  },
                  child: CustomPendiksCard(
                    workSpacePendiks: widget.provider.myPendikWorkSpaceDetails[index],
                  ),
                ),

                // (
                //   workSpaceDetail: widget.provider.myWorkSpaceDetails[0],
                //   isButtonVisible: true,
                //   provider: widget.provider,
                // ),
              ),
            ),
          );
  }
}
