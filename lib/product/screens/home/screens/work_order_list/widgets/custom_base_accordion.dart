import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants/other/colors.dart';
import '../../../../../../feature/extensions/context_extension.dart';

class CustomBaseAccordion extends StatelessWidget {
  const CustomBaseAccordion({super.key, required this.list});

  final List<AccordionSection> list;

  @override
  Widget build(BuildContext context) {
    return Accordion(
      maxOpenSections: 1,
      headerBackgroundColor: APPColors.Accent.black,
      headerBackgroundColorOpened: APPColors.Accent.black,
      contentBorderColor: context.theme ? APPColors.Main.white : APPColors.Main.black,
      scaleWhenAnimating: true,
      openAndCloseAnimation: true,
      sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
      sectionClosingHapticFeedback: SectionHapticFeedback.light,
      paddingListTop: 0,
      paddingListBottom: 0,
      paddingListHorizontal: 0,
      children: list,
    );
  }
}
