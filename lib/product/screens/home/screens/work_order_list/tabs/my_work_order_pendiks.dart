import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../../../feature/components/cards/custom_pending_card_undetail.dart';
import '../../../../../../feature/extensions/context_extension.dart';
import '../provider/work_order_list_provider.dart';
import '../widgets/custom_loading_indicator.dart';

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
      widget.provider.getMyPendikWorkOrders(context.locale.languageCode);
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
                child: CustomPendingCardUndetail(
                  provider: widget.provider,
                  pendiks: widget.provider.myPendikWorkSpaceDetails[index],
                  onTap: () {},
                ),
              ),
            ),
          );
  }
}
