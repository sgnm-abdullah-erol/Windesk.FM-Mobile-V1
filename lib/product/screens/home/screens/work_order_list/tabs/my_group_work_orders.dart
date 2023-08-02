import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../../../feature/constants/other/colors.dart';
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
                    child: CustomBaseAccordion(
                      list: [_accordionSection(index)],
                    ),
                  );
                },
              ),
            ),
    );
  }

  AccordionSection _accordionSection(int index) {
    return AccordionSection(
      header: Row(
        children: [
          InkWell(
            onTap: () {},
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
          for (int i = 0; i < (widget.provider.workSpaceMyGroupDemandList?.children?[index].children?.length.toInt() ?? 0); i++) ...{
            CustomBaseAccordionSections().baseAccordionSection(
              context,
              widget.provider.workSpaceMyGroupDemandList?.children?[index].children?[i].name ?? '',
              widget.provider.workSpaceMyGroupDemandList?.children?[index].children?[i].taskCount.toString() ?? '',
              widget.provider.workSpaceMyGroupDemandList?.children?[index].children?[i].id.toString() ?? '',
            ),
          }
        ],
      ),
    );
  }
}
