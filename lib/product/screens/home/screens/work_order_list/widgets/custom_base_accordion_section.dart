import 'package:accordion/accordion_section.dart';
import 'package:flutter/material.dart';

class CustomBaseAccordionSections {
  AccordionSection baseAccordionSection(String header, String count, int accordionId) {
    return AccordionSection(
      onOpenSection: () {},
      header: Row(
        children: [
          Text(header),
          const Spacer(),
          Text(count),
        ],
      ),
      content: const SizedBox(),
    );
  }
}
