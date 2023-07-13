import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_detail.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/provider/work_order_detail_provider.dart';

import '../../../../../../feature/components/cards/custom_wo_detail_summary.card.dart';
import '../../work_order_list/widgets/custom_loading_indicator.dart';

@RoutePage()
class DetailWorkOrderScreen extends StatefulWidget {
  const DetailWorkOrderScreen({super.key, required this.workSpaceDetail});

  final WorkSpaceDetail workSpaceDetail;

  @override
  State<DetailWorkOrderScreen> createState() => _DetailWorkOrderScreenState();
}

class _DetailWorkOrderScreenState extends State<DetailWorkOrderScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkOrderDetailProvider(),
      child: Consumer<WorkOrderDetailProvider>(
        builder: (context, WorkOrderDetailProvider woDetailProvider, child) {
          return Scaffold(
            appBar: CustomMainAppbar(title: Text(widget.workSpaceDetail.task?.name ?? ''), returnBack: true, elevation: 4),
            body: context.read<WorkOrderDetailProvider>().isLoading
                ? const CustomLoadingIndicator()
                : Column(
                    children: [
                      WoSummary(workSpaceDetail: widget.workSpaceDetail),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

// StatelessWidget _woDetailSummary(BuildContext context) {
//   WorkOrderDetailsModel woDetail = context.read<WorkOrderDetailProvider>().woDetailList;
//   return WoSummary(woModel: woDetail);
// }
