import 'package:accordion/accordion_section.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/other/colors.dart';

class CustomBaseAccordionSections {
  AccordionSection baseAccordionSection(String header, String taskCount) {
    return AccordionSection(
      headerBackgroundColor: APPColors.Accent.black,
      rightIcon: const Icon(Icons.arrow_drop_down, size: 0),
      onOpenSection: () {},
      header: Row(
        children: [
          Text(header, style: TextStyle(color: APPColors.Main.white, letterSpacing: 1.5)),
          const Spacer(),
          Text(taskCount, style: TextStyle(color: APPColors.Main.white)),
        ],
      ),
      content: const SizedBox(),
    );
  }
}
