import 'package:flutter/material.dart';

import '../../../core/constants/other/colors.dart';
import '../../extensions/context_extension.dart';

class WoCreateCard extends StatelessWidget {
  const WoCreateCard(
      {super.key,
      required this.widget1,
      required this.widget2,
      required this.widget3,
      required this.widget1Required,
      required this.widget2Required,
      required this.widget3Required});

  final Widget widget1;
  final Widget widget2;
  final Widget widget3;
  final bool widget1Required;
  final bool widget2Required;
  final bool widget3Required;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: context.width,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [_isRequired(widget1Required, widget1), _isRequired(widget2Required, widget2), _isRequired(widget3Required, widget3)],
        ),
      ),
    );
  }

  Widget _isRequired(bool isRequired, Widget widget) {
    return isRequired
        ? Row(
            children: [
              Expanded(flex: 15, child: widget),
              Expanded(flex: 1, child: Text('*', style: TextStyle(color: APPColors.Main.red, fontSize: 13)))
            ],
          )
        : Row(
            children: [
              Expanded(flex: 15, child: widget),
              Expanded(flex: 1, child: Text('', style: TextStyle(color: APPColors.Main.red, fontSize: 13)))
            ],
          );
  }
}
