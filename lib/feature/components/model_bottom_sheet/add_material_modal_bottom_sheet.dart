import 'package:flutter/material.dart';
import '../buttons/custom_half_buttons.dart';
import '../input_fields/dropdown_input_fields.dart';
import '../input_fields/text_fields_input_underline.dart';

import '../../constants/other/app_strings.dart';
import '../../extensions/context_extension.dart';

class AddMaterialModalBottomSheet extends StatefulWidget {
  const AddMaterialModalBottomSheet({
    super.key,
    required this.wareHouseList,
    required this.selectAmount,
    required this.approveButton,
  });
  final List<String> wareHouseList;
  final Function selectAmount;
  final Function approveButton;

  @override
  State<AddMaterialModalBottomSheet> createState() => _AddMaterialModalBottomSheetState();
}

class _AddMaterialModalBottomSheetState extends State<AddMaterialModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return _bodyWidget(context);
  }

  _bodyWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          children: [
            const Expanded(flex: 70, child: _Inputs()),
            Expanded(
              flex: 70,
              child: CustomHalfButtons(
                leftTitle: const Text(AppStrings.cancel),
                rightTitle: const Text(AppStrings.cancel),
                leftOnPressed: () {},
                rightOnPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Inputs extends StatelessWidget {
  const _Inputs();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 30,
          child: DropDownInputFields(
            labelText: 'Malzeme Listesi',
            onChangedFunction: (newValue) {},
            rightIcon: Icons.arrow_downward,
            dropDownArray: const ['1', '2', '3'],
          ),
        ),
        Expanded(
          flex: 20,
          child: TextFieldsInputUnderline(
            onChanged: (newValue) {},
            hintText: 'Malzeme miktari',
            enabled: false,
          ),
        ),
        Expanded(
          flex: 20,
          child: TextFieldsInputUnderline(
            onChanged: (newValue) {},
            hintText: 'Malzeme unit',
            enabled: false,
          ),
        ),
        Expanded(
          flex: 20,
          child: TextFieldsInputUnderline(
            onChanged: (newValue) {},
            hintText: 'Kullanici tarafindan girilecek malzeme miktari',
            enabled: false,
          ),
        ),
      ],
    );
  }
}
