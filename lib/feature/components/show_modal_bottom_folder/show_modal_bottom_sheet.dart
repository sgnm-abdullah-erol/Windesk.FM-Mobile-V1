import 'package:flutter/material.dart';

class ShowModalBottomSheet {
  Future<dynamic> show(context, Widget showWidget) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      builder: (BuildContext context) {
        return showWidget;
      },
    );
  }
}
