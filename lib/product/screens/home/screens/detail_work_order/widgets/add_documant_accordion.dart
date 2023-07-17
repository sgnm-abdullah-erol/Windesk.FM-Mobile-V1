import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';

import '../../../../../../feature/components/buttons/custom_row_accordion_button.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import 'data_table_accordion.dart';

class AddDocumantAccordion extends StatelessWidget {
  const AddDocumantAccordion({super.key});

  @override
  Widget build(BuildContext context) {
    return Accordion(
      maxOpenSections: 1,
      headerBackgroundColorOpened: Colors.black54,
      children: [
        AccordionSection(
          header: const Text(AppStrings.addImage),
          content: CustomRowAccordionButton(onPressed: () {}, buttonTitle: AppStrings.addMaterial),
        ),
        AccordionSection(
          header: const Text(AppStrings.addPdf),
          content: CustomRowAccordionButton(onPressed: () {}, buttonTitle: AppStrings.addMaterial),
        ),
        AccordionSection(
          header: const Text(AppStrings.addedDocumants),
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
