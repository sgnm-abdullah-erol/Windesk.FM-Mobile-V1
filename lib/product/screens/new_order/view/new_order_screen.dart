import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:vm_fm_4/feature/components/input_fields/dropdown_input_fields.dart';
import 'package:vm_fm_4/feature/components/input_fields/text_fields_input_underline.dart';
import 'package:vm_fm_4/feature/constants/functions/null_check_widget.dart';
import 'package:vm_fm_4/feature/constants/style/custom_paddings.dart';
import 'package:vm_fm_4/feature/l10n/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/new_order/provider/wo_create_provider.dart';

@RoutePage()
class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WoCreateProvider(),
      child: Consumer<WoCreateProvider>(builder: (context, WoCreateProvider woCreateProvider, child) {
         woCreateProvider.locationLoading ? woCreateProvider.getLocation() : null;
        return Scaffold(
          appBar: const CustomMainAppbar(title: Text(LocaleKeys.newWorkOrder)),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  TextFieldsInputUnderline(
                      hintText: 'Summary',
                      onChanged: (String newValue) {
                        woCreateProvider.setSummary(newValue);
                      }),
                  const SizedBox(height: 15),
                  DropDownInputFields(
                    labelText: 'Requested By',
                    onChangedFunction: (String newValue) {
                      woCreateProvider.setRequestedBy(newValue);
                    },
                    rightIcon: Icons.arrow_drop_down_rounded,
                    dropDownArray: const ['asdasd', 'asd'],
                  ),
                  const SizedBox(height: 15),
                  DropDownInputFields(
                    labelText: 'Type',
                    onChangedFunction: (String newValue) {
                      woCreateProvider.setType(newValue);
                    },
                    rightIcon: Icons.arrow_drop_down_rounded,
                    dropDownArray: const ['asdasd', 'asd'],
                  ),
                  const SizedBox(height: 15),
                  DropDownInputFields(
                    labelText: 'Location',
                    onChangedFunction: (String newValue) {
                      woCreateProvider.setLocation(newValue);
                    },
                    rightIcon: Icons.arrow_drop_down_rounded,
                    dropDownArray: woCreateProvider.woLocationList,
                  ),
                  Padding(
                      padding: CustomPaddings.onlyLeft,
                      child: NullCheckWidget().nullCheckWidget(
                        woCreateProvider.location,
                        Container(),
                        DropDownInputFields(
                          labelText: 'Location tree',
                          onChangedFunction: (String newValue) {
                            woCreateProvider.setLocation(newValue);
                          },
                          rightIcon: Icons.arrow_drop_down_rounded,
                          dropDownArray: const ['asdasd', 'asd'],
                        ),
                      )),
                  const SizedBox(height: 15),
                  DropDownInputFields(
                    labelText: 'Request Type',
                    onChangedFunction: (String newValue) {
                      woCreateProvider.setrequestType(newValue);
                    },
                    rightIcon: Icons.arrow_drop_down_rounded,
                    dropDownArray: const ['asdasd', 'asd'],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
