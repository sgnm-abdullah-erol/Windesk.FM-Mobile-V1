import 'package:flutter/material.dart';

class ShowModalBottomSheet {
  show(context, Widget showWidget) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return showWidget;
      },
    );
  }
}
