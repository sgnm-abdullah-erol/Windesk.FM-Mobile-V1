import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../../../feature/components/model_bottom_sheet/add_document_modal_bottom_sheet.dart';
import '../../../../../../feature/components/model_bottom_sheet/add_image_modal_bottom_sheet.dart';
import '../../../../../../feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';
import '../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import '../../../../../../feature/constants/other/colors.dart';
import '../../work_order_list/widgets/custom_loading_indicator.dart';
import '../provider/work_order_detail_provider.dart';
import '../provider/work_order_detail_service_provider.dart';
import 'tables/data_table_accordion_documants.dart';

class AddDocumantAccordion extends StatelessWidget {
  const AddDocumantAccordion({super.key, required this.provider});
  final WorkOrderDetailProvider provider;

  @override
  Widget build(BuildContext context) {
    return Accordion(
      headerBackgroundColorOpened: APPColors.Accent.black,
      maxOpenSections: 1,
      children: [
        AccordionSection(
          contentBorderWidth: 0,
          contentHorizontalPadding: 0,
          contentVerticalPadding: 0,
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.camera, color: APPColors.Main.white),
          header: Text(AppStrings.addImage, style: TextStyle(color: APPColors.Main.white)),
          rightIcon: const Icon(AppIcons.arrowDown, size: 0),
          onOpenSection: () {
            ShowModalBottomSheet().show(
              context,
              AddImageModalBottomSheet(
                taskId: provider.detail.task?.id.toString() ?? '',
                taskKey: provider.detail.task?.key ?? '',
              ),
            );
          },
          content: const SizedBox(height: 0),
        ),
        AccordionSection(
          contentBorderWidth: 0,
          contentHorizontalPadding: 0,
          contentVerticalPadding: 0,
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.pictureAsPdf, color: APPColors.Main.white),
          header: Text(AppStrings.addPdf, style: TextStyle(color: APPColors.Main.white)),
          rightIcon: const Icon(AppIcons.arrowDown, size: 0),
          onOpenSection: () {
            ShowModalBottomSheet().show(
              context,
              AddDocumentsModalBottomSheet(
                taskId: provider.detail.task?.id.toString() ?? '',
                taskKey: provider.detail.task?.key ?? '',
              ),
            );
          },
          content: const SizedBox(height: 0),
        ),
        AccordionSection(
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.documantScanner, color: APPColors.Main.white),
          header: Text(AppStrings.addedDocumants, style: TextStyle(color: APPColors.Main.white)),
          onOpenSection: () {
            Provider.of<WorkOrderDetailServiceProvider>(context, listen: false).update();
            provider.userClickedDocumantsFunction();
          },
          content: Consumer<WorkOrderDetailServiceProvider>(
            builder: (context, value, child) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                provider.userClickedDocumants
                    ? value.isDocumantListFetched
                        ? null
                        : value.fetchDocumants(
                            provider.detail.task?.id.toString() ?? '',
                          )
                    : null;
              });

              return value.isLoading
                  ? const CustomLoadingIndicator()
                  : DataTableAccordionDocumants(
                      delete: () {},
                      data: value.workSpaceDocuments,
                    );
            },
          ),
        )
      ],
    );
  }
}
