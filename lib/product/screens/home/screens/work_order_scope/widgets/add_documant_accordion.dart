import 'package:accordion/accordion.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/provider/work_order_detail_service_provider.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/widgets/tables/data_table_accordion_documants.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/widgets/custom_loading_indicator.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_scope/provider/scope_provider.dart';

import '../../../../../../../core/constants/other/app_icons.dart';
import '../../../../../../../core/constants/other/colors.dart';
import '../../../../../../../feature/components/model_bottom_sheet/add_document_modal_bottom_sheet.dart';
import '../../../../../../../feature/components/model_bottom_sheet/add_image_modal_bottom_sheet.dart';
import '../../../../../../../feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';
import '../../../../../../../generated/locale_keys.g.dart';

class AddDocumantAccordion extends StatelessWidget {
  const AddDocumantAccordion({super.key, required this.provider, required this.taskId, required this.taskKey});
  final ScopeProvider provider;
  final String taskId;
  final String taskKey;

  @override
  Widget build(BuildContext context) {
    return Accordion(
      headerBackgroundColorOpened: APPColors.Accent.black,
      maxOpenSections: 1,
      children: [
        AccordionSection(
          headerPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          contentBorderWidth: 0,
          contentHorizontalPadding: 0,
          contentVerticalPadding: 0,
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.camera, color: APPColors.Main.white),
          header: Text(LocaleKeys.AddImage.tr(), style: context.labelMedium.copyWith(color: APPColors.Main.white)),
          rightIcon: const Icon(AppIcons.arrowDown, size: 0),
          onOpenSection: () {
            ShowModalBottomSheet().show(
              context,
              AddImageModalBottomSheet(
                taskId: taskId ?? '',
                taskKey: taskKey ?? '',
                saveImage: provider.saveImage,
              ),
            );
          },
          content: const SizedBox(height: 0),
        ),
        AccordionSection(
          headerPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          contentBorderWidth: 0,
          contentHorizontalPadding: 0,
          contentVerticalPadding: 0,
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.pictureAsPdf, color: APPColors.Main.white),
          header: Text(LocaleKeys.AddPdf.tr(), style: context.labelMedium.copyWith(color: APPColors.Main.white)),
          rightIcon: const Icon(AppIcons.arrowDown, size: 0),
          onOpenSection: () {
            ShowModalBottomSheet().show(
              context,
              AddDocumentsModalBottomSheet(
                taskId: taskId ?? '',
                taskKey: taskKey ?? '',
                function: provider.savePdf,
              ),
            );
          },
          content: const SizedBox(height: 0),
        ),
        AccordionSection(
          headerPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.documantScanner, color: APPColors.Main.white),
          header: Text(LocaleKeys.AddedDocumants, style: context.labelMedium.copyWith(color: APPColors.Main.white)).tr(),
          onOpenSection: () {
            //Provider.of<WorkOrderDetailServiceProvider>(context, listen: false).update();
            provider.userClickedDocumantsFunction();
          },
          content: Consumer<WorkOrderDetailServiceProvider>(
            builder: (context, value, child) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                provider.userClickedDocumants
                    ? value.isDocumantListFetched
                        ? null
                        : value.fetchDocumants(taskId ?? '')
                    : null;
              });

              return value.isLoading ? const CustomLoadingIndicator() : DataTableAccordionDocumants(provider: value, data: value.workSpaceDocuments);
            },
          ),
        )
      ],
    );
  }
}
