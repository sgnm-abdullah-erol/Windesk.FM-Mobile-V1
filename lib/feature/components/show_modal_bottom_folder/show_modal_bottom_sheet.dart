import 'package:flutter/material.dart';

class ShowModalBottomSheet {
  show(context, Widget showWidget) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return showWidget;
      },
    );
  }
}
