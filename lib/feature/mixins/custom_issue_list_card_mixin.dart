import 'package:flutter/material.dart';

import '../components/cards/custom_issue_list_card.dart';
import '../constants/other/colors.dart';
import '../constants/style/border_radius.dart';
import '../constants/style/font_sizes.dart';

mixin CustomIssueListCardConstantsMixin<T extends CustomIssueListCard> {
  final String dateTimeFormat = 'yyyyMMddhhmmss';
  final String zeroStr = '0';
  final String oneStr = '1';
  final String locationStr = 'Lokasyon';
  final String placeStr = 'Mahal';
  final String descriptionStr = 'Açıklama';
  final String descriptionDateStr = 'Açıklama Tarihi';
  final String happenedDescription = 'Gerçekleşen Açıklama';
  final String happenedDescriptionDaterError = 'Düzeltme tarihine ulaşılamadı : ';
  final String numErrorStr = '5000000000000000';
  final String happenedFix = 'Gerçekleşen Düzeltme';
  final String happenedResponse = 'Gerçekleşen Yanıtlama: ';
  final String goalResponse = 'Hedef Yanıtlama';
  final String goalFix = 'Hedef Düzeltme';
  final String remainDate = 'Kalan Süre: ';
  final String datedCase = 'Randevulu Vaka';
  final String statusCodeCheckTxt = 'OPlanned';

  final String remainDateKey = 'kalanSure';
  final String goalResponseKey = 'hedefYanitlama';
  final String issueListTextKey = 'issueListText';

  final double letterSpacing = 0.5;
}

mixin CustomIssueListCardStylesMixin<T extends CustomIssueListCard> {
  final BoxDecoration containerDecoration = BoxDecoration(
    borderRadius: CustomBorderRadius.mediumBorderRadius,
    boxShadow: const [BoxShadow(color: Color(0x19025273), blurRadius: 50, offset: Offset(6, 8))],
    color: APPColors.Main.white,
  );

  final EdgeInsets containerPadding = const EdgeInsets.only(top: 8, left: 12, right: 8, bottom: 8);

  final TextStyle commonStyle = const TextStyle(
    color: Color(0xff025273),
    fontSize: FontSizes.caption - 1,
  );
}
