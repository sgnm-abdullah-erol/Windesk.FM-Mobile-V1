import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/model_bottom_sheet/add_documents_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/components/model_bottom_sheet/add_photo_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';

import '../../../../../../feature/components/buttons/custom_row_accordion_button.dart';
import '../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import '../../../../../../feature/constants/other/colors.dart';
import '../provider/work_order_detail_provider.dart';
import 'data_table_accordion.dart';

class AddDocumantAccordion extends StatelessWidget {
  const AddDocumantAccordion({super.key, required this.provider});
  final WorkOrderDetailProvider provider;

  test() {}

  @override
  Widget build(BuildContext context) {
    return Accordion(
      headerBackgroundColorOpened: APPColors.Main.black,
      maxOpenSections: 1,
      children: [
        AccordionSection(
          headerBackgroundColor: APPColors.Login.blue,
          leftIcon: Icon(AppIcons.camera, color: APPColors.Main.white),
          header: const Text(AppStrings.addImage),
          content: CustomRowAccordionButton(
              onPressed: () {
                ShowModalBottomSheet().show(context, AddPhotoModalBottomSheet(test, test, test, 'Açıklama'));
              },
              buttonTitle: AppStrings.addImage),
        ),
        AccordionSection(
          headerBackgroundColor: APPColors.Login.blue,
          leftIcon: Icon(AppIcons.pictureAsPdf, color: APPColors.Main.white),
          header: const Text(AppStrings.addPdf),
          content: CustomRowAccordionButton(
              onPressed: () {
                ShowModalBottomSheet().show(context, AddDocumentsModalBottomSheet(test, test, 'Açıklama', pickDocumentFunction: test));
              },
              buttonTitle: AppStrings.addMaterial),
        ),
        AccordionSection(
          headerBackgroundColor: APPColors.Clear.green,
          leftIcon: Icon(AppIcons.documantScanner, color: APPColors.Main.white),
          header: const Text(AppStrings.addedDocumants),
          content: Consumer<WorkOrderDetailServiceProvider>(
            builder: (context, value, child) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                value.isDocumantListFetched ? null : value.fetchDocumants();
              });
              return value.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : DataTableAccordion(
                      delete: () {},
                      labelList: ['urunler', 'asdasd', 'asdasd', 'asdasd', 'sdasd'].toList(),
                      data: provider.woEffortList != null ? provider.woEffortList!.effort : null,
                    );
            },
          ),
        )
      ],
    );
  }
}
