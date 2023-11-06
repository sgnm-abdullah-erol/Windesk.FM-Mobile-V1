// ignore_for_file: deprecated_member_use

import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/model_bottom_sheet/add_efforts_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/provider/work_order_detail_provider.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/widgets/tables/data_table_accordion_efforts.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/widgets/custom_loading_indicator.dart';

import '../../../../../../../core/constants/other/app_icons.dart';
import '../../../../../../../core/constants/other/colors.dart';
import '../../provider/work_order_detail_service_provider.dart';

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
          headerPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          isOpen: false,
          headerBackgroundColor: APPColors.Accent.black,
          contentBackgroundColor: APPColors.Accent.black,
          contentBorderWidth: 0,
          contentHorizontalPadding: 0,
          contentVerticalPadding: 0,
          contentBorderColor: APPColors.Main.white,
          rightIcon: const Icon(AppIcons.arrowDown, size: 0),
          leftIcon: Icon(AppIcons.add, color: APPColors.Main.white),
          header: Text(LocaleKeys.AddEfforts, style: context.labelMedium.copyWith(color: APPColors.Main.white)).tr(),
          sectionOpeningHapticFeedback: SectionHapticFeedback.none,
          scrollIntoViewOfItems: ScrollIntoViewOfItems.slow,
          sectionClosingHapticFeedback: SectionHapticFeedback.none,
          onOpenSection: () {
            ShowModalBottomSheet().show(
              context,
              AddEffortsModalBottomSheet(
                selectedStartDate: provider.setStartEffortDate,
                selectedEndtDate: provider.setEndEffortDate,
                selectedEffortDuration: provider.setEffortDuration,
                selectedEffortType: provider.setEffortType,
                selectedDescription: provider.setEffortDescription,
                addEffortFunction: provider.addEffort,
              ),
            );
          },
          onCloseSection: () {},
          content: const SizedBox(height: 0),
        ),
        AccordionSection(
          headerPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.compareRounded, color: APPColors.Main.white),
          header: Text(LocaleKeys.AddedEfforts, style: context.labelMedium.copyWith(color: APPColors.Main.white)).tr(),
          onOpenSection: () {
            Provider.of<WorkOrderDetailServiceProvider>(context, listen: false).update();
            provider.userClickedEffortsFunction();
          },
          content: Consumer<WorkOrderDetailServiceProvider>(
            builder: (context, value, child) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                provider.userClickedEfforts
                    ? value.isEffortListFetched
                        ? null
                        : value.fetchEfforts(
                            provider.detail.task?.id.toString() ?? '',
                            provider.detail.state?.nextStates?.first.id.toString() ?? '',
                          )
                    : null;
              });

              return value.isLoading ? const CustomLoadingIndicator() : DataTableAccordionEfforts(data: value.woEffortList ?? [], provider: value);
            },
          ),
        )
      ],
    );
  }
}
