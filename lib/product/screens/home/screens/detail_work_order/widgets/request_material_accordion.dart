import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/model_bottom_sheet/add_material_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/constants/other/colors.dart';

import '../../../../../../feature/components/buttons/custom_row_accordion_button.dart';
import '../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import 'data_table_accordion.dart';

class RequestMaterialAccordion extends StatelessWidget {
  const RequestMaterialAccordion({super.key});
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
          header: const Text(AppStrings.requstMaterial),
          content: CustomRowAccordionButton(
              onPressed: () {
                ShowModalBottomSheet().show(
                    context,
                    AddMaterialModalBottomSheet(
                        wareHouseList: ['depo1', 'depo2', 'depo3'],
                        productList: ['urun1', 'urun2', 'urun3'],
                        unitList: ['birim1', 'birim2', 'birim3'],
                        selectWareHouseFunction: test,
                        selectProductFunction: test,
                        selectUnitFunction: test,
                        saveAmountFunction: test,
                        addMaterial: test));
              },
              buttonTitle: AppStrings.requstMaterial),
        ),
        AccordionSection(
          headerBackgroundColor: APPColors.Clear.green,
          leftIcon: Icon(AppIcons.tool, color: APPColors.Main.white),
          header: const Text(AppStrings.requstedMaterials),
          content: DataTableAccordion(
            delete: () {},
            labelList: ['urunler', 'asdasd', 'asdasd'].toList(),
            data: const ['asdasd', 'asdsad', 'adasdas'].toList(),
          ),
        )
      ],
    );
  }
}
