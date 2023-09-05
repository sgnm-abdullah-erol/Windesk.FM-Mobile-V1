import 'package:accordion/accordion.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../../../core/constants/other/colors.dart';
import '../../../../../../core/route/app_route.gr.dart';
import '../provider/work_order_list_provider.dart';
import '../widgets/custom_base_accordion.dart';
import '../widgets/custom_base_accordion_section.dart';
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
      widget.provider.getMyGroupWorkOrders();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: widget.provider.isLoading
          ? const CustomLoadingIndicator()
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: widget.provider.workSpaceMyGroupDemandList?.children?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: _custom(index),
                  );
                },
              ),
            ),
    );
  }

  dynamic _custom(index) {
    if (widget.provider.workSpaceMyGroupDemandList?.children?[index].children != null) {
      return CustomBaseAccordion(
        list: [_accordionSection(index)],
      );
    } else {
      return CustomBaseAccordionSections().rootAccordionSection(
        context,
        widget.provider.workSpaceMyGroupDemandList?.children?[index].name ?? '',
        widget.provider.workSpaceMyGroupDemandList?.children?[index].taskCount.toString() ?? '',
        widget.provider.workSpaceMyGroupDemandList?.children?[index].id.toString() ?? '',
      );
    }
  }

  AccordionSection _accordionSection(int index) {
    int count = widget.provider.workSpaceMyGroupDemandList?.children?[index].taskCount ?? 0;
    bool needExtra = false;
    int i = 0;

    for (int i = 0; i < (widget.provider.workSpaceMyGroupDemandList?.children?[index].children?.length.toInt() ?? 0); i++) {
      count -= widget.provider.workSpaceMyGroupDemandList?.children?[index].children?[i].taskCount ?? 0;
    }
    if (count != (widget.provider.workSpaceMyGroupDemandList?.children?[index].children?.length.toInt() ?? 0)) {
      needExtra = true;
    }
    return AccordionSection(
      header: Row(
        children: [
          InkWell(
            onTap: () {
              if (widget.provider.workSpaceMyGroupDemandList?.children?[index].taskCount.toString() != '0') {
                context.router.push(
                  WorkOrderGroupDetailScreen(
                    requestCode: widget.provider.workSpaceMyGroupDemandList?.children?[index].id.toString() ?? '',
                    appTitle: widget.provider.workSpaceMyGroupDemandList?.children?[index].name ?? '',
                  ),
                );
              }
            },
            child: Text(
              widget.provider.workSpaceMyGroupDemandList?.children?[index].name ?? '',
              style: TextStyle(color: APPColors.Main.white, letterSpacing: 1.5),
            ),
          ),
          const Spacer(),
          Text(
            widget.provider.workSpaceMyGroupDemandList?.children?[index].taskCount.toString() ?? '',
            style: TextStyle(color: APPColors.Main.white),
          ),
        ],
      ),
      content: Accordion(
        maxOpenSections: 0,
        headerBackgroundColorOpened: APPColors.Accent.black,
        children: [
          for (i = 0; i < (widget.provider.workSpaceMyGroupDemandList?.children?[index].children?.length.toInt() ?? 0); i++) ...{
            CustomBaseAccordionSections().baseAccordionSection(
              context,
              widget.provider.workSpaceMyGroupDemandList?.children?[index].children?[i].name ?? '',
              widget.provider.workSpaceMyGroupDemandList?.children?[index].children?[i].taskCount.toString() ?? '',
              widget.provider.workSpaceMyGroupDemandList?.children?[index].children?[i].id.toString() ?? '',
            ),
          },
          if (needExtra == true && i == (widget.provider.workSpaceMyGroupDemandList?.children?[index].children?.length.toInt() ?? 0)) ...{
            CustomBaseAccordionSections().baseAccordionSection(
              context,
              widget.provider.workSpaceMyGroupDemandList?.children?[index].name ?? '',
              count.toString(),
              widget.provider.workSpaceMyGroupDemandList?.children?[index].id.toString() ?? '',
            ),
          }
        ],
      ),
    );
  }
}
