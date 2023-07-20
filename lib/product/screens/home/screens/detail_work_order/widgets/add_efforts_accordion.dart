// ignore_for_file: deprecated_member_use

import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/model_bottom_sheet/add_efforts_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/constants/other/app_strings.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/provider/work_order_detail_provider.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/widgets/data_table_accordion.dart';

import '../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../feature/constants/other/colors.dart';

class AddEffortsAccordion extends StatelessWidget {
  const AddEffortsAccordion({super.key, required this.provider});

  final WorkOrderDetailProvider provider;

  @override
  Widget build(BuildContext context) {
    return Accordion(
      headerBackgroundColorOpened: APPColors.Main.black,
      maxOpenSections: 1,
      children: [
        AccordionSection(
          isOpen: false,
          headerBackgroundColor: APPColors.Login.blue,
          contentBackgroundColor: APPColors.Main.white,
          contentBorderWidth: 0,
          contentHorizontalPadding: 0,
          contentVerticalPadding: 0,
          contentBorderColor: APPColors.Main.white,
          rightIcon: const Icon(Icons.abc, size: 0),
          leftIcon: Icon(AppIcons.add, color: APPColors.Main.white),
          header: const Text(AppStrings.addEffort),
          onOpenSection: () {
            ShowModalBottomSheet().show(
                context,
                AddEffortsModalBottomSheet(
                  () {},
                  addEffortFunction: () {},
                  selectedTime: "15 dk",
                  dayArray: const ["1", "2", "3"],
                  hoursArray: const ["1", "2", "3"],
                  minuteArray: const ["1", "2", "3"],
                ));
          },
          content: const SizedBox(height: 0),
        ),
        AccordionSection(
          headerBackgroundColor: APPColors.Clear.green,
          leftIcon: Icon(AppIcons.compareRounded, color: APPColors.Main.white),
          header: const Text(AppStrings.addedEfforts),
          onOpenSection: () {},
          content: Consumer<WorkOrderDetailServiceProvider>(
            builder: (context, value, child) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                value.isEffortListFetched ? null : value.fetchEfforts();
              });

              return value.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : DataTableAccordion(
                      delete: () {},
                      labelList: ['id', 'Tip', 'İsim', 'Süre', 'Sil'].toList(),
                      data: provider.woEffortList != null ? provider.woEffortList!.effort : null,
                    );
            },
          ),
        )
      ],
    );
  }
}
