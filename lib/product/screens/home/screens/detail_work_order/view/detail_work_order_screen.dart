import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/provider/work_order_detail_provider.dart';

import '../../../../../../feature/components/cards/custom_wo_detail_summary.card.dart';
import '../../../../../../feature/models/work_order_models/work_order_details_model.dart';
import '../../work_order_list/widgets/custom_loading_indicator.dart';

@RoutePage()
class DetailWorkOrderScreen extends StatefulWidget {
  const DetailWorkOrderScreen({required this.workOrderCode, super.key});

  final String workOrderCode;

  @override
  State<DetailWorkOrderScreen> createState() => _DetailWorkOrderScreenState();
}

class _DetailWorkOrderScreenState extends State<DetailWorkOrderScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      WorkOrderDetailProvider woDetailProvider = WorkOrderDetailProvider();
      woDetailProvider.getWorkOrderDetails(widget.workOrderCode);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkOrderDetailProvider(),
      child: Consumer<WorkOrderDetailProvider>(
        builder: (context, WorkOrderDetailProvider woDetailProvider, child) {
          return context.read<WorkOrderDetailProvider>().isLoading
              ? const Center(child: CustomLoadingIndicator())
              : Column(
                  children: [
                    WoSummary(woModel: context.read<WorkOrderDetailProvider>().woDetailList),
                  ],
                );
        },
      ),
    );
  }
}

StatelessWidget _woDetailSummary(BuildContext context) {
  WorkOrderDetailsModel woDetail = context.read<WorkOrderDetailProvider>().woDetailList;
  return WoSummary(woModel: woDetail);
}
