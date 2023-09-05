import 'package:flutter/material.dart';

import '../../../core/constants/other/colors.dart';
import '../../extensions/context_extension.dart';

class WoCreateCard extends StatelessWidget {
  const WoCreateCard({super.key, required this.widget1, required this.widget2, required this.widget3});

  final Widget widget1;
  final Widget widget2;
  final Widget widget3;
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        shadowColor: APPColors.Main.black,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Container(
          width: context.width,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [widget1, widget2, widget3],
          ),
        ));
  }
}
