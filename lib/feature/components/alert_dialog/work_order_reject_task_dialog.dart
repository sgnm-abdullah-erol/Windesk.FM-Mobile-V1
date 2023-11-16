import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/constants/other/app_icons.dart';
import 'package:vm_fm_4/feature/components/input_fields/dropdown_input_fields.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/product/screens/home/screens/work_order_list/provider/work_order_reject_task_provider.dart';
import '../../../generated/locale_keys.g.dart';

import '../../../core/constants/style/border_radius.dart';

class WorkOrderRejectTaskDialog {
  static Future<bool> workOrderRejectStatus(BuildContext context, String workSpaceId, String taskId) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return ChangeNotifierProvider(
          create: (_) => WorkOrderRejectTaskProvider(),
          child: Consumer<WorkOrderRejectTaskProvider>(
            builder: (context, value, child) {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) => value.init(workSpaceId, taskId));
              return value.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : AlertDialog(
                      title: Text(LocaleKeys.RejectTaskState.tr(), style: context.bodyMedium),
                      shape: RoundedRectangleBorder(borderRadius: CustomBorderRadius.mediumBorderRadius),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 10),
                          DropDownInputFields(
                            labelText: LocaleKeys.State.tr(),
                            onChangedFunction: value.onChangeStateName,
                            rightIcon: AppIcons.arrowDown,
                            dropDownArray: value.stateNames,
                          ),
                          const SizedBox(height: 10),
                          value.showGroupSelection
                              ? DropDownInputFields(
                                  labelText: LocaleKeys.SelectGroup.tr(),
                                  onChangedFunction: () {},
                                  rightIcon: AppIcons.arrowDown,
                                  dropDownArray: value.groupNames,
                                )
                              : const SizedBox(),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text(LocaleKeys.Cancel.tr()),
                        ),
                        TextButton(
                          onPressed: () {
                            value.rejectState(workSpaceId, taskId, context);
                          },
                          child: Text(LocaleKeys.Reject.tr()),
                        ),
                      ],
                    );
            },
          ),
        );
      },
    );
  }
}
