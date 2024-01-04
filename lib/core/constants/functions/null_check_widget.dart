// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

@immutable
class NullCheckWidget {
  Widget nullCheckWidget(String? text, Widget EmptyWidget, Widget fullFilledWidget) {
    if (text == '' || text == null || text == 'null') {
      return EmptyWidget;
    } else {
      return fullFilledWidget;
    }
  }

  Widget isLeafFalse(bool? isLeafFalse, Widget FullFilledWidget) {
    if (isLeafFalse == true) {
      return Container();
    } else {
      return FullFilledWidget;
    }
  }
}
