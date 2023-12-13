import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:vm_fm_4/core/route/app_route.gr.dart';
import 'package:vm_fm_4/feature/components/cards/custom_workorder_list_card.dart';

import '../../../../../../feature/extensions/context_extension.dart';
import '../provider/work_order_list_provider.dart';
import '../widgets/custom_loading_indicator.dart';

class MyGroupWorkOrders extends StatefulWidget {
  const MyGroupWorkOrders({super.key, required this.provider});

  final WorkOrderListProvider provider;

  @override
  State<MyGroupWorkOrders> createState() => _MyGroupWorkOrdersState();
}

class _MyGroupWorkOrdersState extends State<MyGroupWorkOrders> {
  int count = 0;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget.provider.getMyGroupWorkOrdersSecond(context.locale.languageCode);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: widget.provider.isLoading
          ? const CustomLoadingIndicator()
          : SizedBox(
              height: context.height,
              width: context.width,
              child: ListView.builder(
                itemCount: widget.provider.myGroupWorkSpaceDetails.length,
                itemBuilder: (context, index) {
                  return CustomWorkOrderListCard(
                    workSpaceDetail: widget.provider.myGroupWorkSpaceDetails[index],
                    isButtonVisible: false,
                    onTap: () {
                      context.router.push(DetailWorkOrderScreen(workSpaceDetail: widget.provider.myGroupWorkSpaceDetails[index])).then((value) {
                        if (value == true) {
                          widget.provider.getMyGroupWorkOrdersSecond(context.locale.languageCode);
                        }
                      });
                    },
                  );
                },
              ),
            ),
    );
  }
}
