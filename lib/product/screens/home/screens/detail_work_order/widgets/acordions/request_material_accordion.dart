import 'package:accordion/accordion.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/widgets/tables/data_table_approved_requested_materials.dart';

import '../../../../../../../core/constants/other/app_icons.dart';
import '../../../../../../../core/constants/other/colors.dart';
import '../../../../../../../feature/components/model_bottom_sheet/request_material_modal_bottom_sheet.dart';
import '../../../../../../../feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../provider/work_order_detail_provider.dart';
import '../../provider/work_order_detail_service_provider.dart';
import '../tables/data_table_requsted_materials.dart';

class RequestMaterialAccordion extends StatelessWidget {
  const RequestMaterialAccordion({super.key, required this.provider});
  final WorkOrderDetailProvider provider;

  test() {}
  @override
  Widget build(BuildContext context) {
    return Accordion(
      maxOpenSections: 1,
      headerBackgroundColorOpened: APPColors.Accent.black,
      children: [
        AccordionSection(
          headerPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          isOpen: false,
          contentBorderWidth: 0,
          contentHorizontalPadding: 0,
          contentVerticalPadding: 0,
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.add, color: APPColors.Main.white),
          header: Text(LocaleKeys.AddRequestMaterial.tr(), style: context.labelMedium.copyWith(color: APPColors.Main.white)),
          rightIcon: const Icon(AppIcons.arrowDown, size: 0),
          onOpenSection: () {
            ShowModalBottomSheet().show(
              context,
              RequestMaterialBottomSheet(
                taskId: provider.detail.task?.id.toString() ?? '',
                workSpaceId: provider.detail.workspace?.id.toString() ?? '',
                function: provider.addRequestedMaterial,
              ),
            );
          },
          content: const SizedBox(height: 0),
        ),
        AccordionSection(
          headerPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.tool, color: APPColors.Main.white),
          header: Text(LocaleKeys.RequestedMaterials.tr(), style: context.labelMedium.copyWith(color: APPColors.Main.white)),
          rightIcon: const Icon(AppIcons.arrowDown, size: 0),
          onOpenSection: () {
            Provider.of<WorkOrderDetailServiceProvider>(context, listen: false).update();
            provider.userClickedRequestedMaterialFunction();
          },
          content: Consumer<WorkOrderDetailServiceProvider>(
            builder: (context, value, child) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                provider.userClickedRequestedMaterial
                    ? value.isRequestedMaterialListFetched
                        ? null
                        : value.fetchRequstedMaterials(provider.detail.task?.id.toString() ?? '')
                    : null;
              });
              return value.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : DataTableAccordionRequstedMaterials(
                      provider: value,
                      data: value.woRequestedMaterialsList,
                    );
            },
          ),
        ),
        AccordionSection(
          headerPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.tool, color: APPColors.Main.white),
          header: Text(LocaleKeys.ApprovedRequestMaterials.tr(), style: context.labelMedium.copyWith(color: APPColors.Main.white)),
          rightIcon: const Icon(AppIcons.arrowDown, size: 0),
          onOpenSection: () {
            Provider.of<WorkOrderDetailServiceProvider>(context, listen: false).update();
            provider.userClickedApprovedRequestedMaterialFunction();
          },
          content: Consumer<WorkOrderDetailServiceProvider>(
            builder: (context, value, child) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                provider.userClickedRequestedApprovedMaterial
                    ? value.isRequstedApprovedMaterialListFetched
                        ? null
                        : value.fetchRequstedApprovedMaterials(provider.detail.task?.id.toString() ?? '')
                    : null;
              });
              return value.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : DataTableAccordionApprovedRequstedMaterials(
                      provider: value,
                      data: value.woRequestedApprovedMaterialsList,
                    );
            },
          ),
        )
      ],
    );
  }
}
