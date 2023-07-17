import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';

import '../../../../../../feature/components/buttons/custom_row_accordion_button.dart';
import '../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import '../../../../../../feature/constants/other/colors.dart';
import 'data_table_accordion.dart';

class AddDocumantAccordion extends StatelessWidget {
  const AddDocumantAccordion({super.key});

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
          content: CustomRowAccordionButton(onPressed: () {}, buttonTitle: AppStrings.addMaterial),
        ),
        AccordionSection(
          headerBackgroundColor: APPColors.Login.blue,
          leftIcon: Icon(AppIcons.pictureAsPdf, color: APPColors.Main.white),
          header: const Text(AppStrings.addPdf),
          content: CustomRowAccordionButton(onPressed: () {}, buttonTitle: AppStrings.addMaterial),
        ),
        AccordionSection(
          headerBackgroundColor: APPColors.Clear.green,
          leftIcon: Icon(AppIcons.documantScanner, color: APPColors.Main.white),
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
