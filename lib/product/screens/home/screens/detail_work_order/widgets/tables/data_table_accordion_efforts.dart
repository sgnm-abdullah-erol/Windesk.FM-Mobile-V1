import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/alert_dialog/work_order_delete_item_alert_dialog.dart';

import '../../../../../../../core/constants/other/app_icons.dart';
import '../../../../../../../core/constants/other/colors.dart';
import '../../../../../../../core/enums/task_node_enums.dart';
import '../../../../../../../feature/extensions/context_extension.dart';
import '../../../../../../../feature/models/work_space/work_space_efforts.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../provider/work_order_detail_service_provider.dart';

class DataTableAccordionEfforts extends StatelessWidget {
  DataTableAccordionEfforts({super.key, required this.data, required this.provider});

  final WorkOrderDetailServiceProvider provider;
  final List<WorkSpaceEfforts> data;

  final List<String> _labelList = [
    LocaleKeys.DataTableID.tr(),
    LocaleKeys.DataTableType.tr(),
    LocaleKeys.DataTableName.tr(),
    LocaleKeys.DataTableDate.tr(),
    LocaleKeys.DataTableDelete.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < data.length; i++) {
      print(data[i].effortType);
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortAscending: true,
        sortColumnIndex: 1,
        showBottomBorder: true,
        horizontalMargin: 0,
        columns: [
          for (var i = 0; i < _labelList.length; i++) ...{
            DataColumn(
              label: Text(_labelList[i], style: _cellTextStyle(context)),
              numeric: false,
            )
          }
        ],
        rows: [
          for (var i = 0; i < (data.length); i++) ...{
            DataRow(cells: [
              DataCell(Text(data[i].id.toString(), style: _cellTextStyle(context))),
              DataCell(Text(data[i].effortType ?? "", style: _cellTextStyle(context))),
              DataCell(Text(data[i].user ?? "", style: _cellTextStyle(context))),
              DataCell(Text(data[i].effortDuration.toString(), style: _cellTextStyle(context))),
              DataCell(
                IconButton(
                  onPressed: () async {
                    final response = await WorkOrderDeleteItemAlertDialog.deleteWorkOrderAlertDialog(context, DeleteItemType.effort, data[i].id ?? 0);

                    if (response == true) {
                      // ignore: use_build_context_synchronously
                      provider.deleteNode(context, data[i].id.toString(), provider.detail.task?.id.toString() ?? '', TaskNodeEnums.effort);
                    }
                  },
                  icon: Icon(AppIcons.delete, color: APPColors.Login.red),
                ),
              ),
            ]),
          },
        ],
      ),
    );
  }

  TextStyle _cellTextStyle(BuildContext context) => context.labelMedium.copyWith(color: APPColors.Main.black);
}
