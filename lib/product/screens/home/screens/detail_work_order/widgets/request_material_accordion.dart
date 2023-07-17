import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';

import '../../../../../../feature/components/buttons/custom_row_accordion_button.dart';
import '../../../../../../feature/constants/other/app_strings.dart';
import 'data_table_accordion.dart';

class RequestMaterialAccordion extends StatelessWidget {
  const RequestMaterialAccordion({super.key});

  @override
  Widget build(BuildContext context) {
    return Accordion(
      maxOpenSections: 1,
      headerBackgroundColorOpened: Colors.black54,
      children: [
        AccordionSection(
          header: const Text(AppStrings.requstMaterial),
          content: CustomRowAccordionButton(onPressed: () {}, buttonTitle: AppStrings.requstMaterial),
        ),
        AccordionSection(
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
