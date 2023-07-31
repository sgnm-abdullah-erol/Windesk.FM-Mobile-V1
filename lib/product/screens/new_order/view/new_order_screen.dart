import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../feature/components/input_fields/dropdown_input_fields.dart';
import '../../../../feature/components/input_fields/text_field_date_picker.dart';
import '../../../../feature/components/input_fields/text_field_time_picker.dart';
import '../../../../feature/components/input_fields/text_fields_input_underline.dart';
import '../../../../feature/constants/functions/null_check_widget.dart';
import '../../../../feature/constants/style/custom_paddings.dart';
import '../../../../feature/l10n/locale_keys.g.dart';
import '../../home/screens/work_order_list/widgets/custom_loading_indicator.dart';
import '../provider/wo_create_provider.dart';

@RoutePage()
class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WoCreateProvider(),
      child: Consumer<WoCreateProvider>(builder: (context, WoCreateProvider woCreateProvider, child) {
        woCreateProvider.locationLoading ? woCreateProvider.getLocation() : null;
        woCreateProvider.requestedLoading ? woCreateProvider.getRequestedByPro() : null;
        woCreateProvider.typeLoading ? woCreateProvider.getType() : null;
        woCreateProvider.requestedTypeLoading ? woCreateProvider.getRequestedType() : null;
        return woCreateProvider.isLoading
            ? const CustomLoadingIndicator()
            : Scaffold(
                appBar: const CustomMainAppbar(title: Text(LocaleKeys.newWorkOrder)),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        children: [
                          TextFieldsInputUnderline(
                              hintText: 'Tanım',
                              onChanged: (String newValue) {
                                woCreateProvider.setSummary(newValue);
                              }),
                          const SizedBox(height: 15),
                          DropDownInputFields(
                            labelText: 'Talep Sahibi',
                            onChangedFunction: (String newValue) {
                              woCreateProvider.setRequestedBy(newValue);
                            },
                            rightIcon: Icons.arrow_drop_down_rounded,
                            dropDownArray: woCreateProvider.getRequestedByChildren,
                          ),
                          const SizedBox(height: 15),
                          DropDownInputFields(
                            labelText: 'Tip',
                            onChangedFunction: (String newValue) {
                              woCreateProvider.setType(newValue);
                            },
                            rightIcon: Icons.arrow_drop_down_rounded,
                            dropDownArray: woCreateProvider.getTypesChildren,
                          ),
                          const SizedBox(height: 15),
                          location(woCreateProvider),
                          const SizedBox(height: 15),
                          DropDownInputFields(
                            labelText: 'Request Type',
                            onChangedFunction: (String newValue) {
                              woCreateProvider.setrequestType(newValue);
                            },
                            rightIcon: Icons.arrow_drop_down_rounded,
                            dropDownArray: const ['asdasd', 'asd'],
                          ),
                          TextFieldDatePicker(label: 'Randevu Tarihi', onTap: (){},),
                          TextFieldTimePicker(label: 'Randevu Saati', onTap: (){},),
                
                        ],
                      ),
                    ),
                  ),
                ),
              );
      }),
    );
  }

  Column location(WoCreateProvider woCreateProvider) {
    return Column(
      children: [
        DropDownInputFields(
                              labelText: 'Lokasyon',
                              onChangedFunction: (String newValue) {
                                woCreateProvider.setLocation(newValue);
                              },
                              rightIcon: Icons.arrow_drop_down_rounded,
                              dropDownArray: woCreateProvider.woLocationListChildren,
                            ),
                                                      Padding(
                              padding: CustomPaddings.onlyLeft,
                              child: NullCheckWidget().isLeafFalse(
                                woCreateProvider.locationLeaf,
                                DropDownInputFields(
                                  labelText: 'Blok',
                                  onChangedFunction: (String newValue) {
                                    woCreateProvider.setBlock(newValue);
                                  },
                                  rightIcon: Icons.arrow_drop_down_rounded,
                                  dropDownArray: woCreateProvider.woBlockListChildren,
                                  leftIconExist: true,
                                  leftIcon: Icons.arrow_right_alt,
                                ),
                              )),
                          Padding(
                              padding: CustomPaddings.onlyLeft * 2,
                              child: NullCheckWidget().isLeafFalse(
                                woCreateProvider.buildingLeaf,
                                DropDownInputFields(
                                  labelText: 'Kat',
                                  onChangedFunction: (String newValue) {
                                    woCreateProvider.setFloor(newValue);
                                  },
                                  rightIcon: Icons.arrow_drop_down_rounded,
                                  dropDownArray: woCreateProvider.woFloorListChildren,
                                  leftIconExist: true,
                                  leftIcon: Icons.arrow_right_alt,
                                ),
                              )),
                          Padding(
                              padding: CustomPaddings.onlyLeft * 1.5,
                              child: NullCheckWidget().isLeafFalse(
                                woCreateProvider.floorLeaf,
                                DropDownInputFields(
                                  labelText: 'Alan',
                                  onChangedFunction: (String newValue) {
                                    woCreateProvider.setSpace(newValue);
                                  },
                                  rightIcon: Icons.arrow_drop_down_rounded,
                                  dropDownArray: woCreateProvider.woSpaceListChildren,
                                  leftIconExist: true,
                                  leftIcon: Icons.arrow_right_alt,
                                ),
                              )),
      ],
    );
  }
}
