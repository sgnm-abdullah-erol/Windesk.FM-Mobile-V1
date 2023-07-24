import 'package:flutter/material.dart';

import '../../constants/other/colors.dart';
import '../../l10n/locale_keys.g.dart';

class TextFieldSearch extends StatefulWidget {
  const TextFieldSearch({super.key, required this.onChangedFunction});

  final Function onChangedFunction;

  @override
  State<TextFieldSearch> createState() => _TextFieldSearchState();
}

class _TextFieldSearchState extends State<TextFieldSearch> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String change) {
        widget.onChangedFunction(change);
      },
      maxLength: 20,
      style: TextStyle(color: APPColors.Main.black),
      decoration: const InputDecoration(
          label: Text(LocaleKeys.woSearch), border: OutlineInputBorder(), prefixIcon: Icon(Icons.work)),
      buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength}) {
        return Align(
          alignment: Alignment.centerLeft,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: 10,
            width: 10.0 * currentLength!,
            color: Colors.green[100],
          ),
        );
      },
    );
  }
}
