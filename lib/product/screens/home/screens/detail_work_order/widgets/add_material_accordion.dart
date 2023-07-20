import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/model_bottom_sheet/add_material_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';

import '../../../../../../feature/components/buttons/custom_row_accordion_button.dart';
import '../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import '../../../../../../feature/constants/other/colors.dart';
import '../provider/work_order_detail_provider.dart';
import 'data_table_accordion.dart';

class AddMaterialAccordion extends StatelessWidget {
  const AddMaterialAccordion({super.key, required this.provider});

  final WorkOrderDetailProvider provider;

  test() {}
  @override
  Widget build(BuildContext context) {
    return Accordion(
      maxOpenSections: 1,
      headerBackgroundColorOpened: APPColors.Accent.black,
      children: [
        AccordionSection(
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.add, color: APPColors.Main.white),
          header: Text(AppStrings.addMaterial, style: TextStyle(color: APPColors.Main.white)),
          content: CustomRowAccordionButton(
              onPressed: () {
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
                        addMaterial: test));
              },
              buttonTitle: AppStrings.addMaterial),
        ),
        AccordionSection(
          headerBackgroundColor: APPColors.Accent.black,
          leftIcon: Icon(AppIcons.warehouse, color: APPColors.Main.white),
          header: Text(AppStrings.addedMaterials, style: TextStyle(color: APPColors.Main.white)),
          content: Consumer<WorkOrderDetailServiceProvider>(
            builder: ((context, value, child) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                provider.userClickedMaterial
                    ? value.isMaterialPartsFetched
                        ? null
                        : value.fetchMaterials()
                    : null;
                value.isMaterialPartsFetched ? null : value.fetchMaterials();
              });

              return value.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : DataTableAccordion(
                      delete: () {},
                      labelList: ['urunler', 'asdasd', 'asdasd', 'asdas', 'asdas'].toList(),
                      data: provider.woEffortList != null ? provider.woEffortList!.effort : null,
                    );
            }),
          ),
        )
      ],
    );
  }
}
