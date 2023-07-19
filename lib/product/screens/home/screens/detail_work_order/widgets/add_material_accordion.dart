import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
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
      headerBackgroundColorOpened: APPColors.Main.black,
      children: [
        AccordionSection(
          headerBackgroundColor: APPColors.Login.blue,
          leftIcon: Icon(AppIcons.add, color: APPColors.Main.white),
          header: const Text(AppStrings.addMaterial),
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
          headerBackgroundColor: APPColors.Clear.green,
          leftIcon: Icon(AppIcons.warehouse, color: APPColors.Main.white),
          header: const Text(AppStrings.addedMaterials),
          content: DataTableAccordion(
            delete: () {},
            labelList: ['urunler', 'asdasd', 'asdasd', 'asdas', 'asdas'].toList(),
            data: provider.woEffortList != null ? provider.woEffortList!.effort : null,
          ),
        )
      ],
    );
  }
}
