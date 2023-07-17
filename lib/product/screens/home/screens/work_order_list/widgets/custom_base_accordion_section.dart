import 'package:accordion/accordion_section.dart';
import 'package:flutter/material.dart';

class CustomBaseAccordionSections {
  AccordionSection baseAccordionSection(String header) {
    return AccordionSection(
      onOpenSection: () {},
      rightIcon: const Icon(Icons.arrow_drop_down, size: 0),
      header: Row(
        children: [
          Text(header),
          const Spacer(),
        ],
      ),
      content: const SizedBox(),
    );
  }
}
