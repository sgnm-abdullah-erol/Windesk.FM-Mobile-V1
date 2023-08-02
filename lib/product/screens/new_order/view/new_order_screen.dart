import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:vm_fm_4/feature/components/cards/custom_wo_create_card.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/feature/constants/other/colors.dart';
import 'package:vm_fm_4/feature/constants/other/snackbar_strings.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';

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
      child: Consumer<WoCreateProvider>(
          builder: (context, WoCreateProvider woCreateProvider, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (woCreateProvider.isWorkOrderCreate) {
            snackBar(context, SnackbarStrings.woCreate, 'success');
          }
        });
        woCreateProvider.isWorkOrderCreate
            ? snackBar(context, SnackbarStrings.woCreate, 'success')
            : null;
        woCreateProvider.locationLoading
            ? woCreateProvider.getLocation()
            : null;
        woCreateProvider.requestedLoading
            ? woCreateProvider.getRequestedByPro()
            : null;
        woCreateProvider.typeLoading ? woCreateProvider.getType() : null;
        woCreateProvider.requestedTypeLoading
            ? woCreateProvider.getRequestedType()
            : null;
        woCreateProvider.categoryLoading
            ? woCreateProvider.getCategory()
            : null;
        woCreateProvider.componentLoading
            ? woCreateProvider.getComponent()
            : null;
        return woCreateProvider.isLoading
            ? const CustomLoadingIndicator()
            : Scaffold(
                appBar: const CustomMainAppbar(
                    title: Text(LocaleKeys.newWorkOrder)),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        children: [
                          WoCreateCard(
                            widget1: TextFieldsInputUnderline(
                                hintText: 'Tanım',
                                onChanged: (String newValue) {
                                  woCreateProvider.setSummary(newValue);
                                }),
                            widget2: TextFieldsInputUnderline(
                                hintText: 'Açıklama',
                                onChanged: (String newValue) {
                                  woCreateProvider.setDescription(newValue);
                                }),
                            widget3: DropdownSearch<String>(
                              items: woCreateProvider.getComponentsChildren,
                              onChanged: (value) {
                                woCreateProvider.setComponent(value.toString());
                              },
                              selectedItem: 'Component',
                              popupProps: PopupProps.menu(
                                showSearchBox: true,
                                fit: FlexFit.loose,
                                constraints: BoxConstraints.tightFor(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          WoCreateCard(
                            widget1: DropDownInputFields(
                              labelText: 'Talep Sahibi',
                              onChangedFunction: (String newValue) {
                                woCreateProvider.setRequestedBy(newValue);
                              },
                              rightIcon: Icons.arrow_drop_down_rounded,
                              dropDownArray:
                                  woCreateProvider.getRequestedByChildren,
                            ),
                            widget2: DropDownInputFields(
                              labelText: 'Tip',
                              onChangedFunction: (String newValue) {
                                woCreateProvider.setType(newValue);
                              },
                              rightIcon: Icons.arrow_drop_down_rounded,
                              dropDownArray: woCreateProvider.getTypesChildren,
                            ),
                            widget3: DropDownInputFields(
                              labelText: 'Kategori',
                              onChangedFunction: (String newValue) {
                                woCreateProvider.setCategory(newValue);
                              },
                              rightIcon: Icons.arrow_drop_down_rounded,
                              dropDownArray:
                                  woCreateProvider.getCategoriesChildren,
                            ),
                          ),
                          const SizedBox(height: 15),
                          WoCreateCard(
                            widget1: location(woCreateProvider, context),
                            widget2: requestType(woCreateProvider, context),
                            widget3: Container(),
                          ),
                          const SizedBox(height: 15),
                          WoCreateCard(
                            widget1: TextFieldDatePicker(
                              label: 'Randevu Tarihi',
                              onTap: (String date) {
                                woCreateProvider.setidate = date;
                              },
                            ),
                            widget2: TextFieldTimePicker(
                              label: 'Randevu Saati',
                              onTap: (String hour) {
                                woCreateProvider.setihour = hour;
                              },
                            ),
                            widget3: Container(),
                          ),
                          CustomHalfButtons(
                            leftTitle: Text(
                              'Vazgeç',
                              style: TextStyle(color: APPColors.Main.white),
                            ),
                            rightTitle: Text(
                              'Kaydet',
                              style: TextStyle(color: APPColors.Main.white),
                            ),
                            leftOnPressed: () {},
                            rightOnPressed: () {
                              woCreateProvider.createTask();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
      }),
    );
  }

  Container requestType(
      WoCreateProvider woCreateProvider, BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          DropDownInputFields(
            labelText: 'Request Type',
            onChangedFunction: (String newValue) {
              woCreateProvider.setRequestType(newValue);
            },
            rightIcon: Icons.arrow_drop_down_rounded,
            dropDownArray: woCreateProvider.getRequestedTypesChildren,
          ),
          Padding(
              padding: CustomPaddings.onlyLeft * 1.5,
              child: NullCheckWidget().isLeafFalse(
                woCreateProvider.requestedTypeTree1,
                DropDownInputFields(
                  labelText: 'Tree1',
                  onChangedFunction: (String newValue) {
                    //woCreateProvider.setRequestType1(newValue);
                  },
                  rightIcon: Icons.arrow_drop_down_rounded,
                  dropDownArray:
                      woCreateProvider.getRequestedTypesChildrenTree1,
                  leftIconExist: true,
                  leftIcon: Icons.arrow_right_alt,
                ),
              )),
        ],
      ),
    );
  }

  Container location(WoCreateProvider woCreateProvider, BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.all(10),
      child: Column(
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
              padding: CustomPaddings.onlyLeft * 1.5,
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
              padding: CustomPaddings.onlyLeft * 3,
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
      ),
    );
  }
}
