import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../constants/other/app_strings.dart';
import '../../constants/other/colors.dart';
import '../../constants/style/font_sizes.dart';
import '../../extensions/context_extension.dart';
import '../buttons/custom_half_buttons.dart';

class WoWaitTaskAcceptModalBottomSheet extends StatelessWidget {
  const WoWaitTaskAcceptModalBottomSheet({
    super.key,
    required this.textData,
    required this.acceptModalAcceptFunction,
    required this.acceptModalRejectFunction,
  });
  final String textData;
  final Function acceptModalAcceptFunction;
  final Function acceptModalRejectFunction;

  @override
  Widget build(BuildContext context) {
    return _bodyWidget(context);
  }

  _bodyWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.50,
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _inputS(textData),
              _buttons(context, acceptModalAcceptFunction, acceptModalRejectFunction),
            ],
          ),
        ),
      ),
    );
  }

  _inputS(textData) {
    return Text(
      textData,
      style: TextStyle(color: APPColors.Main.black, fontWeight: FontWeight.bold, fontSize: FontSizes.subtitle),
    );
  }

  _buttons(context, Function acceptFunction, rejectFunction) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomHalfButtons(
            leftTitle: const Text(AppStrings.cancel),
            rightTitle: const Text(AppStrings.save),
            leftOnPressed: rejectFunction,
            rightOnPressed: acceptFunction)
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Function>('saveEffort', acceptModalAcceptFunction));
  }
}
