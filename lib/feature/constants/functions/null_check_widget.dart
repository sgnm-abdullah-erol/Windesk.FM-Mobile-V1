import 'package:flutter/material.dart';

@immutable
class NullCheckWidget {
  // ignore: non_constant_identifier_names
  Widget nullCheckWidget(String? text, Widget EmptyWidget, Widget fullFilledWidget) {
    if (text == '' || text == null || text == 'null') {
      return EmptyWidget;
    } else {
      return fullFilledWidget;
    }
  }

  Widget isLeafFalse(bool? isLeafFalse, Widget fullFilledWidget) {
    if (isLeafFalse == true) {
      return Container();
    } else {
      return fullFilledWidget;
    }
  }
}
