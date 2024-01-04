import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/core/constants/other/time_functions.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/provider/work_order_detail_provider.dart';

import '../../../core/constants/style/border_radius.dart';
import '../../../generated/locale_keys.g.dart';

class GetTaskHistoryModalBottomSheet {
  Future<bool?> showAlertDialog(
      BuildContext context,
      WorkOrderDetailProvider workOrderDetailProvider,
      String textData,
      String title) async {
    // show the dialog
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (context) =>
              WorkOrderDetailProvider(detail: workOrderDetailProvider.detail),
          child: Consumer<WorkOrderDetailProvider>(
            builder: (context, value, child) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: CustomBorderRadius.mediumBorderRadius),
                title: Text(title, style: context.titleMedium).tr(),
                content: SizedBox(
                  width: 150,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView(
                    children: [
                      for (var i = 0;
                          i <
                              (workOrderDetailProvider
                                      .taskHistoryData?.length ??
                                  0);
                          i++) ...{
                        ListTile(
                            title: Text(
                              TimeClass().convertDateToLocal(
                                  workOrderDetailProvider.taskHistoryData?[i]
                                      [1]),
                              style: const TextStyle(fontSize: 15),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  workOrderDetailProvider.taskHistoryData?[i]
                                      [0],
                                  style: const TextStyle(fontSize: 13),
                                ),
                                Text(
                                  workOrderDetailProvider.taskHistoryData?[i][2]
                                      [0],
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Divider(),
                              ],
                            ))
                      }
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(LocaleKeys.Okey.tr()),
                    onPressed: () => context.router.pop<bool>(false),
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
