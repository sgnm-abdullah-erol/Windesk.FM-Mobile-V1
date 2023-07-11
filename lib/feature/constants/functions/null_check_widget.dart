import 'package:flutter/material.dart';

@immutable
class NullCheckWidget {
  // ignore: non_constant_identifier_names
  Widget nullCheckWidget(String? text, Widget EmptyWidget, Widget FullFilledWidget) {
    if (text == '' || text == null || text == 'null') {
      return EmptyWidget;
    } else {
      return FullFilledWidget;
    }
  }
}
