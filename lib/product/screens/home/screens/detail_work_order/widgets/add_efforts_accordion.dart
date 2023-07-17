// ignore_for_file: deprecated_member_use

import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_row_accordion_button.dart';
import 'package:vm_fm_4/feature/constants/other/app_strings.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/widgets/data_table_accordion.dart';

import '../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../feature/constants/other/colors.dart';

class AddEffortsAccordion extends StatelessWidget {
  const AddEffortsAccordion({super.key});

  @override
  Widget build(BuildContext context) {
    return Accordion(
      headerBackgroundColorOpened: APPColors.Main.black,
      maxOpenSections: 1,
      children: [
        AccordionSection(
          headerBackgroundColor: APPColors.Login.blue,
          leftIcon: Icon(AppIcons.add, color: APPColors.Main.white),
          header: const Text(AppStrings.addEffort),
          content: CustomRowAccordionButton(onPressed: () {}, buttonTitle: AppStrings.addEffort),
        ),
        AccordionSection(
          headerBackgroundColor: APPColors.Clear.green,
          leftIcon: Icon(AppIcons.compareRounded, color: APPColors.Main.white),
          header: const Text(AppStrings.addedEfforts),
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
