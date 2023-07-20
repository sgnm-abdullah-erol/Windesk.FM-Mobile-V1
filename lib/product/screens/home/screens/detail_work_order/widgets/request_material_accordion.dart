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
import 'data_table_accordion.dart';

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
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.add, color: APPColors.Main.white),
          header: Text(AppStrings.requstMaterial, style: TextStyle(color: APPColors.Main.white)),
          rightIcon: const Icon(AppIcons.arrowDown, size: 0),
          onOpenSection: () {
            ShowModalBottomSheet().show(
              context,
              AddMaterialModalBottomSheet(
                wareHouseList: const ['depo1', 'depo2', 'depo3'],
                productList: const ['urun1', 'urun2', 'urun3'],
                unitList: const ['birim1', 'birim2', 'birim3'],
                selectWareHouseFunction: test,
                selectProductFunction: test,
                selectUnitFunction: test,
                saveAmountFunction: test,
                addMaterial: test,
              ),
            );
          },
          content: const SizedBox(height: 0),
        ),
        AccordionSection(
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.tool, color: APPColors.Main.white),
          header: Text(AppStrings.requstedMaterials, style: TextStyle(color: APPColors.Main.white)),
          rightIcon: const Icon(AppIcons.arrowDown, size: 0),
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
                  : DataTableAccordion(
                      delete: () {},
                      labelList: ['urunler', 'asdasd', 'asdasd', 'asdsad', 'asda'].toList(),
                      data: provider.woEffortList != null ? provider.woEffortList!.effort : null,
                    );
            },
          ),
        )
      ],
    );
  }
}
