// ignore_for_file: deprecated_member_use

import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_row_accordion_button.dart';
import 'package:vm_fm_4/feature/constants/other/app_strings.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/widgets/data_table_accordion.dart';

class AddEffortsAccordion extends StatelessWidget {
  const AddEffortsAccordion({super.key});

  @override
  Widget build(BuildContext context) {
    return Accordion(
      maxOpenSections: 1,
      headerBackgroundColorOpened: Colors.black54,
      children: [
        AccordionSection(
          header: const Text(AppStrings.addEffort),
          content: CustomRowAccordionButton(onPressed: () {}, buttonTitle: AppStrings.addEffort),
        ),
        AccordionSection(
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
