// ignore_for_file: deprecated_member_use

import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_row_accordion_button.dart';
import 'package:vm_fm_4/feature/components/model_bottom_sheet/add_efforts_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/components/show_modal_bottom_folder/show_modal_bottom_sheet.dart';
import 'package:vm_fm_4/feature/constants/other/app_strings.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/widgets/data_table_accordion.dart';

import '../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../feature/constants/other/colors.dart';

class AddEffortsAccordion extends StatelessWidget {
  const AddEffortsAccordion({super.key});
  test() {}

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
          content: CustomRowAccordionButton(
              onPressed: () {
                ShowModalBottomSheet().show(
                    context,
                    AddEffortsModalBottomSheet(
                      test,
                      addEffortFunction: test,
                      selectedTime: "15 dk",
                      dayArray: const ["1", "2", "3"],
                      hoursArray: const ["1", "2", "3"],
                      minuteArray: const ["1", "2", "3"],
                    ));
              },
              buttonTitle: AppStrings.addEffort),
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
