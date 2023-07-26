import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../../../../../feature/components/model_bottom_sheet/add_material_modal_bottom_sheet.dart';
import '../../../../../../feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';
import '../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import '../../../../../../feature/constants/other/colors.dart';
import '../provider/work_order_detail_provider.dart';
import '../provider/work_order_detail_service_provider.dart';
import 'tables/data_table_requsted_materials.dart';

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
          isOpen: false,
          contentBorderWidth: 0,
          contentHorizontalPadding: 0,
          contentVerticalPadding: 0,
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.add, color: APPColors.Main.white),
          header: Text(AppStrings.requstMaterial, style: TextStyle(color: APPColors.Main.white)),
          rightIcon: const Icon(AppIcons.arrowDown, size: 0),
          onOpenSection: () {
            ShowModalBottomSheet().show(
              context,
              AddMaterialModalBottomSheet(taskId: provider.detail.task?.id.toString() ?? '0'),
            );
          },
          content: const SizedBox(height: 0),
        ),
        AccordionSection(
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.tool, color: APPColors.Main.white),
          header: Text(AppStrings.requstedMaterials, style: TextStyle(color: APPColors.Main.white)),
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
                        : value.fetchRequestedMaterials()
                    : null;
              });
              return value.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : DataTableAccordionRequstedMaterials(
                      delete: () {},
                      data: value.woRequestedMaterials,
                    );
            },
          ),
        )
      ],
    );
  }
}
