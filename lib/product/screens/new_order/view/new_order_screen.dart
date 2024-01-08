// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/themes/theme_provider.dart';
import 'package:vm_fm_4/feature/components/input_fields/dropdown_input_fields2.dart';
import 'package:vm_fm_4/product/screens/home/screens/search_work_order/provider/search_work_order_provider.dart';

import '../../../../core/constants/functions/null_check_widget.dart';
import '../../../../core/constants/other/snackbar_strings.dart';
import '../../../../core/constants/style/custom_paddings.dart';
import '../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../feature/components/buttons/custom_half_buttons.dart';
import '../../../../feature/components/cards/custom_wo_create_card.dart';
import '../../../../feature/components/input_fields/text_field_date_picker.dart';
import '../../../../feature/components/input_fields/text_field_time_picker.dart';
import '../../../../feature/components/input_fields/text_fields_input_underline.dart';
import '../../../../feature/components/snackBar/snackbar.dart';
import '../../../../feature/extensions/context_extension.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../home/screens/work_order_list/widgets/custom_loading_indicator.dart';
import '../provider/wo_create_provider.dart';

@RoutePage()
class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WoCreateProvider()),
        ChangeNotifierProvider(create: (context) => SearchWorkOrderProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer3<WoCreateProvider, SearchWorkOrderProvider, ThemeProvider>(
          builder: (context, WoCreateProvider woCreateProvider, SearchWorkOrderProvider searchWorkOrderProvider, ThemeProvider themeProvider, child) {
        // themeProvider.getPreferences();
        print(context.locale);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (woCreateProvider.isWorkOrderCreate) {
            snackBar(context, SnackbarStrings.woCreate, 'success');
            showDialog(
              context: context,
              builder: (dialogContext) {
                return AlertDialog(
                  title: const Text(
                    LocaleKeys.NewWorkOrderCreated,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  content: Text("${LocaleKeys.WorkOrderNumber} ${woCreateProvider.isWorkOrderCreatedId}"),
                  actions: [
                    TextButton(
                      child: const Text(LocaleKeys.Okey),
                      onPressed: () {
                        Navigator.pop(dialogContext);
                      },
                    ),
                    TextButton(
                      child: const Text(LocaleKeys.SeeDetail),
                      onPressed: () {
                        searchWorkOrderProvider.getWorkSpaceWithSearchFromGroupWorks(dialogContext, woCreateProvider.isWorkOrderCreatedId);
                      },
                    ),
                  ],
                );
              },
            );
          }
          if (woCreateProvider.createTaskError) {
            snackBar(context, SnackbarStrings.woCreateError, 'error');
          }
        });
        //woCreateProvider.isWorkOrderCreate ? snackBar(context, SnackbarStrings.woCreate, 'success') : null;
        //woCreateProvider.createTaskError ? snackBar(context, SnackbarStrings.woCreateError, 'error') : null;
        woCreateProvider.locationLoading ? woCreateProvider.getLocation() : null;
        woCreateProvider.requestedLoading ? woCreateProvider.getRequestedByPro() : null;
        woCreateProvider.typeLoading ? woCreateProvider.getType() : null;
        woCreateProvider.requestedTypeLoading ? woCreateProvider.getRequestedType() : null;
        woCreateProvider.categoryLoading ? woCreateProvider.getCategory() : null;
        woCreateProvider.componentLoading ? woCreateProvider.getComponent() : null;
        woCreateProvider.workSpaceLoading ? woCreateProvider.getWorkFlows(context) : null;
        return woCreateProvider.isLoading
            ? const CustomLoadingIndicator()
            : WillPopScope(
                child: Scaffold(
                  appBar: const CustomMainAppbar(title: LocaleKeys.NewWorkOrder),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Column(
                          children: [
                            WoCreateCard(
                              widget1: TextFieldsInputUnderline(
                                  hintText: LocaleKeys.Defination,
                                  onChanged: (String newValue) {
                                    woCreateProvider.setSummary(newValue);
                                  }),
                              widget2: TextFieldsInputUnderline(
                                  hintText: LocaleKeys.Explanation,
                                  onChanged: (String newValue) {
                                    woCreateProvider.setDescription(newValue);
                                  }),
                              widget3: DropdownSearch<String>(
                                items: woCreateProvider.getComponentsChildren,
                                onChanged: (value) {
                                  woCreateProvider.setComponent(value.toString());
                                },
                                selectedItem: LocaleKeys.Component.tr(),
                                popupProps: const PopupProps.menu(
                                  showSearchBox: true,
                                  fit: FlexFit.loose,
                                  constraints: BoxConstraints.tightFor(),
                                ),
                              ),
                              widget1Required: true,
                              widget2Required: true,
                              widget3Required: false,
                            ),
                            const SizedBox(height: 15),
                            WoCreateCard(
                              widget1: DropDownInputFields2(
                                labelText: LocaleKeys.OrderOwner,
                                onChangedFunction: (String newValue) {
                                  woCreateProvider.setRequestedBy(newValue);
                                },
                                rightIcon: Icons.arrow_drop_down_rounded,
                                dropDownArray: woCreateProvider.getRequestedByChildren,
                              ),
                              widget2: DropDownInputFields2(
                                labelText: LocaleKeys.Type,
                                onChangedFunction: (String newValue) {
                                  woCreateProvider.setType(newValue);
                                },
                                rightIcon: Icons.arrow_drop_down_rounded,
                                dropDownArray: woCreateProvider.getTypesChildren,
                              ),
                              widget3: DropDownInputFields2(
                                labelText: LocaleKeys.Category,
                                onChangedFunction: (String newValue) {
                                  woCreateProvider.setCategory(newValue);
                                },
                                rightIcon: Icons.arrow_drop_down_rounded,
                                dropDownArray: woCreateProvider.getCategoriesChildren,
                              ),
                              widget1Required: true,
                              widget2Required: true,
                              widget3Required: false,
                            ),
                            const SizedBox(height: 15),
                            WoCreateCard(
                              widget1: location(woCreateProvider, context),
                              widget2: requestType(woCreateProvider, context),
                              widget3: Padding(
                                padding: const EdgeInsets.all(10),
                                child: DropDownInputFields2(
                                  labelText: LocaleKeys.Workflows,
                                  onChangedFunction: (String newValue) {
                                    woCreateProvider.setWorkFlow(newValue);
                                  },
                                  rightIcon: Icons.arrow_drop_down_rounded,
                                  dropDownArray: woCreateProvider.workFlowNames,
                                ),
                              ),
                              widget1Required: true,
                              widget2Required: false,
                              widget3Required: true,
                            ),
                            const SizedBox(height: 15),
                            WoCreateCard(
                              widget1: TextFieldDatePicker(
                                label: LocaleKeys.AppointmentDatee,
                                onTap: (String date) {
                                  woCreateProvider.setidate = date;
                                },
                                initialDate: DateTime.now(),
                                lastDate: DateTime.now().add(const Duration(days: 30)),
                              ),
                              widget2: TextFieldTimePicker(
                                label: LocaleKeys.AppointmentHour,
                                onTap: (String hour) {
                                  woCreateProvider.setihour = hour;
                                },
                              ),
                              widget3: Container(),
                              widget1Required: false,
                              widget2Required: false,
                              widget3Required: false,
                            ),
                            CustomHalfButtons(
                              leftTitle: LocaleKeys.Cancel,
                              rightTitle: LocaleKeys.Save,
                              leftOnPressed: () {
                                woCreateProvider.setAllClear();
                              },
                              rightOnPressed: () {
                                woCreateProvider.selectedLeafIsTrue
                                    ? woCreateProvider.createTask(context)
                                    : snackBar(context, SnackbarStrings.woCreateErrorLocation, 'error');
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                onWillPop: () async => false,
              );
      }),
    );
  }

  Container requestType(WoCreateProvider woCreateProvider, BuildContext context) {
    return Container(
      width: context.width,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          DropDownInputFields2(
            labelText: LocaleKeys.RequestType,
            onChangedFunction: (String newValue) {
              woCreateProvider.setRequestType1('');

              woCreateProvider.setRequestType(newValue);
              //woCreateProvider.setRequestType1(woCreateProvider.getRequestedTypesChildrenTree1[0]);
            },
            rightIcon: Icons.arrow_drop_down_rounded,
            dropDownArray: woCreateProvider.getRequestedTypesChildren,
          ),
          woCreateProvider.requestType1 != ''
              ? Padding(
                  padding: CustomPaddings.onlyLeft * 1.5,
                  child: NullCheckWidget().isLeafFalse(
                    woCreateProvider.requestedTypeTree1,
                    DropDownInputFields2(
                      labelText: LocaleKeys.Choose,
                      onChangedFunction: (String newValue) {
                        woCreateProvider.setRequestType1(newValue);
                      },
                      rightIcon: Icons.arrow_drop_down_rounded,
                      dropDownArray: woCreateProvider.getRequestedTypesChildrenTree1,
                      leftIconExist: true,
                      leftIcon: Icons.arrow_right_alt,
                    ),
                  ))
              : Padding(
                  padding: CustomPaddings.onlyLeft * 1.5,
                  child: NullCheckWidget().isLeafFalse(
                    woCreateProvider.requestedTypeTree1,
                    DropDownInputFields2(
                      labelText: LocaleKeys.Choose,
                      onChangedFunction: (String newValue) {
                        woCreateProvider.setRequestType1(newValue);
                      },
                      rightIcon: Icons.arrow_drop_down_rounded,
                      dropDownArray: [LocaleKeys.View.tr()],
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
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          DropDownInputFields2(
            labelText: LocaleKeys.Location,
            onChangedFunction: (String newValue) {
              woCreateProvider.setLocation(newValue);
              woCreateProvider.setBlock(woCreateProvider.woBlockListChildren[0]);
              woCreateProvider.setFloor(woCreateProvider.woFloorListChildren[0]);
              woCreateProvider.setSpace(woCreateProvider.woSpaceListChildren[0]);
            },
            rightIcon: Icons.arrow_drop_down_rounded,
            dropDownArray: woCreateProvider.woLocationListChildren,
          ),
          Padding(
              padding: CustomPaddings.onlyLeft * 1.5,
              child: NullCheckWidget().isLeafFalse(
                woCreateProvider.locationLeaf,
                woCreateProvider.woBlockListChildren.isNotEmpty
                    ? DropDownInputFields2(
                        labelText: LocaleKeys.Block,
                        onChangedFunction: (String newValue) {
                          woCreateProvider.setBlock(newValue);
                          woCreateProvider.setFloor(woCreateProvider.woFloorListChildren[0]);
                          woCreateProvider.setSpace(woCreateProvider.woSpaceListChildren[0]);
                        },
                        rightIcon: Icons.arrow_drop_down_rounded,
                        dropDownArray: woCreateProvider.woBlockListChildren,
                        leftIconExist: true,
                        leftIcon: Icons.arrow_right_alt,
                      )
                    : Container(),
              )),
          Padding(
              padding: CustomPaddings.onlyLeft * 3,
              child: NullCheckWidget().isLeafFalse(
                woCreateProvider.buildingLeaf,
                woCreateProvider.woFloorListChildren.isNotEmpty
                    ? DropDownInputFields2(
                        labelText: LocaleKeys.Floor,
                        onChangedFunction: (String newValue) {
                          woCreateProvider.setFloor(newValue);
                          woCreateProvider.setSpace(woCreateProvider.woSpaceListChildren[0]);
                        },
                        rightIcon: Icons.arrow_drop_down_rounded,
                        dropDownArray: woCreateProvider.woFloorListChildren,
                        leftIconExist: true,
                        leftIcon: Icons.arrow_right_alt,
                      )
                    : Container(),
              )),
          Padding(
              padding: CustomPaddings.onlyLeft * 4.5,
              child: NullCheckWidget().isLeafFalse(
                woCreateProvider.floorLeaf,
                woCreateProvider.woSpaceListChildren.isNotEmpty
                    ? DropDownInputFields2(
                        labelText: LocaleKeys.Space,
                        onChangedFunction: (String newValue) {
                          woCreateProvider.setSpace(newValue);
                        },
                        rightIcon: Icons.arrow_drop_down_rounded,
                        dropDownArray: woCreateProvider.woSpaceListChildren,
                        leftIconExist: true,
                        leftIcon: Icons.arrow_right_alt,
                      )
                    : Container(),
              )),
        ],
      ),
    );
  }
}
