// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/product/screens/home/screens/search_work_order/provider/search_work_order_provider.dart';

import '../../../../core/constants/functions/null_check_widget.dart';
import '../../../../core/constants/other/colors.dart';
import '../../../../core/constants/other/snackbar_strings.dart';
import '../../../../core/constants/style/custom_paddings.dart';
import '../../../../core/l10n/locale_keys.g.dart';
import '../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../feature/components/buttons/custom_half_buttons.dart';
import '../../../../feature/components/cards/custom_wo_create_card.dart';
import '../../../../feature/components/input_fields/dropdown_input_fields.dart';
import '../../../../feature/components/input_fields/text_field_date_picker.dart';
import '../../../../feature/components/input_fields/text_field_time_picker.dart';
import '../../../../feature/components/input_fields/text_fields_input_underline.dart';
import '../../../../feature/components/snackBar/snackbar.dart';
import '../../../../feature/extensions/context_extension.dart';
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
      ],
      child: Consumer2<WoCreateProvider, SearchWorkOrderProvider>(
          builder: (context, WoCreateProvider woCreateProvider, SearchWorkOrderProvider searchWorkOrderProvider, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (woCreateProvider.isWorkOrderCreate) {
            snackBar(context, SnackbarStrings.woCreate, 'success');

            showDialog(
              context: context,
              builder: (dialogContext) {
                return AlertDialog(
                  title: const Text(
                    "Yeni İş Emri Oluşturuldu.",
                    style: TextStyle(fontSize: 14),
                  ),
                  content: Text("İş Emri NO : ${woCreateProvider.isWorkOrderCreatedId}"),
                  actions: [
                    TextButton(
                      child: const Text("Tamam"),
                      onPressed: () {
                        //Navigator.of(context).pop();

                        Navigator.pop(dialogContext);
                      },
                    ),
                    TextButton(
                      child: const Text("Detayı Gör"),
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
        return woCreateProvider.isLoading
            ? const CustomLoadingIndicator()
            : WillPopScope(
                child: Scaffold(
                  appBar: const CustomMainAppbar(title: Text(LocaleKeys.newWorkOrder)),
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
                                selectedItem: 'Bileşen',
                                popupProps: const PopupProps.menu(
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
                                dropDownArray: woCreateProvider.getRequestedByChildren,
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
                                dropDownArray: woCreateProvider.getCategoriesChildren,
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
                                initialDate: DateTime.now(),
                                lastDate: DateTime.now().add(const Duration(days: 30)),
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
                    woCreateProvider.setRequestType1(newValue);
                  },
                  rightIcon: Icons.arrow_drop_down_rounded,
                  dropDownArray: woCreateProvider.getRequestedTypesChildrenTree1,
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
              padding: CustomPaddings.onlyLeft * 4.5,
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
