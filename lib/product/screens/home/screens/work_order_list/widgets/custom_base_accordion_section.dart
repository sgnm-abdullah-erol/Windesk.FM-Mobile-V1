import 'package:accordion/accordion_section.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants/other/colors.dart';
import '../../../../../../core/route/app_route.gr.dart';
import '../../../../../../feature/extensions/context_extension.dart';

class CustomBaseAccordionSections {
  static AccordionSection baseAccordionSection(BuildContext context, String header, String taskCount, String requestId) {
    return AccordionSection(
      headerPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      headerBackgroundColor: APPColors.Accent.black,
      rightIcon: const Icon(Icons.arrow_drop_down, size: 0),
      isOpen: false,
      onOpenSection: () {
        if (int.parse(taskCount) > 0) {
          context.router.push(WorkOrderGroupDetailScreen(requestCode: requestId, appTitle: header));
        }
      },
      header: Row(
        children: [
          Text(header, style: context.bodySmall.copyWith(color: APPColors.Main.white)),
          const Spacer(),
          Text(taskCount, style: context.bodySmall.copyWith(color: APPColors.Main.white)),
        ],
      ),
      content: const SizedBox(),
    );
  }

  static AccordionSection rootAccordionSection(BuildContext context, String header, String taskCount, String requestId) {
    return AccordionSection(
      headerPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      headerBackgroundColor: APPColors.Accent.black,
      rightIcon: const Icon(Icons.arrow_drop_down, size: 0),
      isOpen: false,
      onOpenSection: () {
        if (int.parse(taskCount) > 0) {
          context.router.push(WorkOrderGroupDetailScreen(requestCode: requestId, appTitle: header));
        }
      },
      header: Row(
        children: [
          Text(header, style: context.bodySmall.copyWith(color: APPColors.Main.white)),
          const Spacer(),
          Text(taskCount, style: context.bodySmall.copyWith(color: APPColors.Main.white)),
        ],
      ),
      content: const SizedBox(),
    );
  }
}
