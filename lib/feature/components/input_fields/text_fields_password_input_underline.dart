// ignore_for_file: prefer_null_aware_operators

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';

import '../../../core/constants/other/app_icons.dart';

class TextInputFieldsPasswordInputUnderline extends StatelessWidget {
  const TextInputFieldsPasswordInputUnderline({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.changeVisibility,
    required this.showPassword,
    this.labelText,
  });

  final String _validatorHintText = 'Lütfen bu alanı doldurunuz';

  final String hintText;
  final String? labelText;
  final Function onChanged;
  final Function changeVisibility;
  final bool showPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !showPassword,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: hintText.tr(),
        labelText: labelText != null ? labelText?.tr() : null,
        suffixIcon: IconButton(
          onPressed: () => changeVisibility(),
          icon: showPassword ? const Icon(AppIcons.visibilityOff) : const Icon(AppIcons.visibility),
        ),
      ),
      style: context.bodyMedium,
      onChanged: (String value) => onChanged(value),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return _validatorHintText;
        }
        return null;
      },
    );
  }
}
