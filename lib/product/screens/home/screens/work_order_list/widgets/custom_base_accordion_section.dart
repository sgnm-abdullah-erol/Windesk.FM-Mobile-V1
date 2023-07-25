import 'package:accordion/accordion_section.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/constants/other/colors.dart';

import '../../../../../../feature/route/app_route.gr.dart';

class CustomBaseAccordionSections {
  AccordionSection baseAccordionSection(BuildContext context, String header, String taskCount, String requestId) {
    return AccordionSection(
      headerBackgroundColor: APPColors.Accent.black,
      rightIcon: const Icon(Icons.arrow_drop_down, size: 0),
      onOpenSection: () {
        if (int.parse(taskCount) > 0) {
          context.router.push(WorkOrderGroupDetailScreen(requestCode: requestId));
        }
      },
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
