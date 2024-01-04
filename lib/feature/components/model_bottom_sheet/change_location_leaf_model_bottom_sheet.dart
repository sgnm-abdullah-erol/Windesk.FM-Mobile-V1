import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/constants/functions/null_check_widget.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/core/constants/style/custom_paddings.dart';
import 'package:vm_fm_4/feature/components/buttons/custom_half_buttons.dart';
import 'package:vm_fm_4/feature/components/input_fields/dropdown_input_fields.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/provider/leaf_location_provider.dart';

import '../../extensions/context_extension.dart';

class ChangeLocationLeafModelBottomSheet extends StatelessWidget {
  const ChangeLocationLeafModelBottomSheet(
      {super.key, required this.rootTitle, required this.taskId, required this.templatedBy, required this.dependedOn});

  final String rootTitle;
  final String taskId;
  final String templatedBy;
  final String dependedOn;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: context.height * 0.8,
        width: context.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: ChangeNotifierProvider(
            create: (_) => LeafLocationProvider(),
            child: Consumer<LeafLocationProvider>(
              builder: (context, value, child) {
                SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                  value.getMainStructure();
                  value.locationLoading ? value.getLocation() : null;
                  if (value.changeLocationSucces) {}
                });
                return value.isLoading
                    ? Center(child: CircularProgressIndicator(color: APPColors.Main.blue))
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(LocaleKeys.SelectaLocation.tr()),
                            location(value, context),
                            value.selectedLocationName != '' ?
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${LocaleKeys.selectedLocation.tr()} ${value.selectedLocationName} ${LocaleKeys.willBeChanged.tr()}',maxLines: 2),
                            ) : Container(),
                            CustomHalfButtons(
                              leftTitle: (
                                LocaleKeys.Cancel
                                
                              ),
                              rightTitle: (
                                LocaleKeys.Approve
                                
                              ),
                              leftOnPressed: () {
                                context.router.pop();
                              },
                              rightOnPressed: () {
                                value.changeLocation(taskId.toString(), templatedBy.toString(), dependedOn, context);
                              },
                            )
                          ],
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }

  Container location(LeafLocationProvider leafLocationProvider, BuildContext context) {
    return Container(
      width: context.width,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          DropDownInputFields(
            labelText: 'Lokasyon',
            onChangedFunction: (String newValue) {
              leafLocationProvider.setLocation(newValue);
            },
            rightIcon: Icons.arrow_drop_down_rounded,
            dropDownArray: leafLocationProvider.woLocationListChildren,
          ),
          Padding(
              padding: CustomPaddings.onlyLeft * 1.5,
              child: NullCheckWidget().isLeafFalse(
                leafLocationProvider.locationLeaf,
                DropDownInputFields(
                  labelText: 'Blok',
                  onChangedFunction: (String newValue) {
                    leafLocationProvider.setBlock(newValue);
                  },
                  rightIcon: Icons.arrow_drop_down_rounded,
                  dropDownArray: leafLocationProvider.woBlockListChildren,
                  leftIconExist: true,
                  leftIcon: Icons.arrow_right_alt,
                ),
              )),
          Padding(
              padding: CustomPaddings.onlyLeft * 3,
              child: NullCheckWidget().isLeafFalse(
                leafLocationProvider.buildingLeaf,
                DropDownInputFields(
                  labelText: 'Kat',
                  onChangedFunction: (String newValue) {
                    leafLocationProvider.setFloor(newValue);
                  },
                  rightIcon: Icons.arrow_drop_down_rounded,
                  dropDownArray: leafLocationProvider.woFloorListChildren,
                  leftIconExist: true,
                  leftIcon: Icons.arrow_right_alt,
                ),
              )),
          Padding(
              padding: CustomPaddings.onlyLeft * 4.5,
              child: NullCheckWidget().isLeafFalse(
                leafLocationProvider.floorLeaf,
                DropDownInputFields(
                  labelText: 'Alan',
                  onChangedFunction: (String newValue) {
                    leafLocationProvider.setSpace(newValue);
                  },
                  rightIcon: Icons.arrow_drop_down_rounded,
                  dropDownArray: leafLocationProvider.woSpaceListChildren,
                  leftIconExist: true,
                  leftIcon: Icons.arrow_right_alt,
                ),
              )),
        ],
      ),
    );
  }
}
