import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

import '../../../../../../core/route/app_route.gr.dart';
import '../../../../../../feature/components/cards/custom_workorder_list_card.dart';
import '../../../../../../feature/extensions/context_extension.dart';
import '../provider/work_order_list_provider.dart';
import '../widgets/custom_loading_indicator.dart';

@RoutePage()
class MyWorkOrders extends StatefulWidget {
  const MyWorkOrders({super.key, required this.provider});

  final WorkOrderListProvider provider;

  @override
  State<MyWorkOrders> createState() => _MyWorkOrdersState();
}

class _MyWorkOrdersState extends State<MyWorkOrders> {
  get workSpaceDetail => null;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) => widget.provider.getMyWorkOrders(context.locale.languageCode));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.provider.isLoading
        ? const CustomLoadingIndicator()
        : SizedBox(
            height: context.height,
            width: context.width,
            child: widget.provider.myWorkSpaceDetails.isEmpty
                ? Center(child: Text(LocaleKeys.NoWorkOrder.tr(), style: Theme.of(context).textTheme.bodyMedium))
                : ListView.builder(
                    itemCount: widget.provider.myWorkSpaceDetails.length,
                    itemBuilder: (context, index) {
                      return CustomWorkOrderListCard(
                        workSpaceDetail: widget.provider.myWorkSpaceDetails[index],
                        isButtonVisible: false,
                        onTap: () {
                          context.router.push(DetailWorkOrderScreen(workSpaceDetail: widget.provider.myWorkSpaceDetails[index])).then(
                            (value) {
                              if (value == true) {
                                widget.provider.setIsMyWorkOrdersDataFetched(false);
                                widget.provider.getMyWorkOrders(context.locale.languageCode);
                              }
                            },
                          );
                        },
                      );
                    },
                  ),
          );
  }
}
