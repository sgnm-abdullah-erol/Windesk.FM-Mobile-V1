import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../../core/route/app_route.gr.dart';
import '../../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../../feature/components/cards/custom_workorder_list_card.dart';
import '../work_order_list/widgets/custom_loading_indicator.dart';
import 'work_order_group_detail_provider.dart';

@RoutePage()
class WorkOrderGroupDetailScreen extends StatelessWidget {
  const WorkOrderGroupDetailScreen({super.key, required this.requestCode, required this.appTitle});

  final String requestCode;
  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkOrderGroupDetailProvider(),
      child: Scaffold(
        appBar: CustomMainAppbar(title: Text(appTitle), elevation: 4, returnBack: true),
        body: Consumer<WorkOrderGroupDetailProvider>(
          builder: (context, WorkOrderGroupDetailProvider provider, child) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              provider.isGroupWorkOrdersDataFetched ? null : provider.getGroupSpaceOrders(requestCode);
            });
            return provider.isLoading ? const CustomLoadingIndicator() : _BuildScaffold(provider, requestCode);
          },
        ),
      ),
    );
  }
}

class _BuildScaffold extends StatelessWidget {
  const _BuildScaffold(this.provider, this.requestCode);

  final WorkOrderGroupDetailProvider provider;
  final String requestCode;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: provider.workSpaceGroupWorkOrdersList.length,
        itemBuilder: (context, index) {
          return CustomWorkOrderListCard(
            workSpaceDetail: provider.workSpaceGroupWorkOrdersList[index],
            isButtonVisible: false,
            onTap: () {
              context.router.push(DetailWorkOrderScreen(workSpaceDetail: provider.workSpaceGroupWorkOrdersList[index])).then((value) {
                if (value == true) {
                  provider.getGroupSpaceOrders(requestCode);
                }
              });
            },
          );
        });
  }
}
